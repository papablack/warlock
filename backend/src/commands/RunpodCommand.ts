
import { ConsoleService, RWSCommand, ICmdParams } from 'rws-js-server';
import fs from 'fs';
import path from 'path';


const { log, warn, error, color, rwsLog } = ConsoleService;

const executionDir = process.cwd();
const moduleCfgDir = `${executionDir}/node_modules/.rws`;
const cfgPathFile = `${moduleCfgDir}/_cfg_path`;  

type IRunpodSubCommand = 'deploy' | 'delete' | string;

interface IRunpodParamsReturn {
    runpodCmd: IRunpodSubCommand
    runpodApiCmd: string
    runpodArg: string    
    extraParams: {
        [key: string]: any
    }
}

class RunpodCommand extends RWSCommand 
{
    constructor(){
        super('runpod', module);
    }

    async execute(params?: ICmdParams): Promise<void>
    {       
        const {  subCmd, apiCmd, apiArg, extraParams } = this.getCommandParameters(params);

       switch(subCmd){
        case 'start':
            await this.start(params);            
            return;       
        default:
            error(`[RWS Runpod CLI] "${subCmd}" command is not supported in RWS Runpod CLI`);        
            return;    
        }    

    }   
    
    async start(params?: ICmdParams): Promise<void>
    {
        ConsoleService.log('Started Runpod CLI');
    }
}

export default RunpodCommand.createCommand();
export { IRunpodParamsReturn }