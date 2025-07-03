import { DebugSession } from "@vscode/debugadapter";
import { DebugProtocol } from "@vscode/debugprotocol";

// Define the interface for the launch request arguments which user will provide with 
// launch.json
interface LaunchRequestArguments extends DebugProtocol.LaunchRequestArguments {
    program: string;
    args?: string[];
    cwd?: string;
    port?: number;
}

export class LspProtocolDebugSession extends DebugSession {
    private static THREAD_ID = 1;

    private _serverProcess: any;

    private _parser: JsonRpcParser;
   
    private _encoder = new TextEncoder();
    private _decoder = new TextDecoder();


    public constructor() {
        super();

        this._parser = new JsonRpcParser((message) => {
         
        });
    }

}

class JsonRpcParser {
    private _buffer: Buffer = Buffer.alloc(0);
    private _headerMode: boolean = true;
    private _contentLength: number = -1;
    private _messageCallback: (message: any) => void;
  
    constructor(messageCallback: (message: any) => void) {
      this._messageCallback = messageCallback;
    }
  
    public handleData(data: Buffer) {
      this._buffer = Buffer.concat([this._buffer, data]); 

      while (true) {
        if (this._headerMode) {
        
          const headerEnd = this._buffer.indexOf('\r\n\r\n');
          if (headerEnd !== -1) {
      
            const headerString = this._buffer.toString('ascii', 0, headerEnd);
            const contentLengthMatch = headerString.match(/Content-Length: (\d+)/);
            if (contentLengthMatch && contentLengthMatch[1]) {
              this._contentLength = parseInt(contentLengthMatch[1], 10);
              this._buffer = this._buffer.slice(headerEnd + 4);
              this._headerMode = false; 
            } else {
        
              console.error('Invalid header received:', headerString);
              this._buffer = Buffer.alloc(0); 
              return;
            }
          } else {
            break;
          }
        } else {
         
          if (this._buffer.length >= this._contentLength) {
         
            const messageBuffer = this._buffer.slice(0, this._contentLength);
            const messageString = messageBuffer.toString('utf8');
            try {
              const message = JSON.parse(messageString);
              this._messageCallback(message);
            } catch (e) {
              console.error('Failed to parse JSON message:', messageString, e);
            }
            this._buffer = this._buffer.slice(this._contentLength);
            this._headerMode = true;
            this._contentLength = -1;
          } else {
            break;
          }
        }
      }
    }
  }