
import { ConsoleService, RWSCommand, ICmdParams } from '@rws-framework/server';


const { error } = ConsoleService;

// const executionDir = process.cwd();
// const moduleCfgDir = `${executionDir}/node_modules/.rws`;

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
        const {  subCmd } = this.getCommandParameters(params);

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
export { IRunpodParamsReturn };