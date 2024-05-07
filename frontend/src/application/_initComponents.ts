import { DefaultLayout } from '../components/default-layout/component';

import { RWSClientInstance } from '@rws-framework/client/src/client'
import { LineSplitter } from '../components/line-splitter/component';
export default (parted: boolean = false) => {
    if(parted){
        LineSplitter;            
    }    

    DefaultLayout;
    RWSClientInstance.defineAllComponents();

};