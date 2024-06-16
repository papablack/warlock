import { Injectable } from '@rws-framework/server/nest';

import IVMConfig from '../types/IRunpodCfg';

@Injectable()
class RunpodService {
    async deployMachine(vmConfig: IVMConfig) {
      
    }

    async callStableDiffusionApi(url: string, prompt: string, params: any) {
        
    }
}

export { RunpodService }