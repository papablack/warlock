import RWSClient, { NotifyUiType, NotifyLogType, RWSContainer } from 'rws-js-client';
//@ts-expect-error no-types
import alertify from 'alertifyjs';

import './styles/main.scss';

import routes from './routing/routes';

import { backendRoutes } from './backendImport';

import initComponents from './application/_initComponents';
// import { provideFASTDesignSystem, allComponents } from '@microsoft/fast-components';

async function initializeApp() {
    const theClient = RWSContainer().get(RWSClient);

    theClient.setBackendRoutes(backendRoutes());
    theClient.enableRouting();
    theClient.addRoutes(routes);    
    
    theClient.onInit(async () => {
        initComponents();
        // provideFASTDesignSystem().register(allComponents);
    });    


    theClient.setNotifier((message: string, logType: NotifyLogType, uiType: NotifyUiType = 'notification', onConfirm: (params: any) => void) => {
        switch(uiType){
        case 'notification':
            let notifType = 'success';

            if(logType === 'error'){
                notifType = 'error';
            }

            if(logType === 'warning'){
                notifType = 'warning';
            }

            alertify.notify(message, notifType, 5, onConfirm);
            return;
        case 'alert':
            alertify.alert('AI Notification', message, onConfirm);
            return;    
        case 'silent':
            if(logType == 'warning'){
                console.warn(message);
            }else if(logType == 'error'){
                console.error(message);
            }else{
                console.log(message);
            }            
            return;    
        }
    });

    theClient.assignClientToBrowser();   

    theClient.start((window as any)._RWS_CFG);
}

initializeApp().catch(console.error);
