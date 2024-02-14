import RWSClient, { NotifyUiType, NotifyLogType } from 'rws-js-client';
//@ts-ignore
import alertify from 'alertifyjs';

import './styles/main.scss';

import routes from './routing/routes';

import { backendRoutes } from './backendImport';

import initComponents from './application/_initComponents';
// import { provideFASTDesignSystem, allComponents } from '@microsoft/fast-components';

async function initializeApp() {    
    const theClient = new RWSClient();

    theClient.setBackendRoutes(backendRoutes());
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
                alertify.alert('Junction AI Notification', message, onConfirm);
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
    (window as any).RWSClient = theClient;    
}

initializeApp().catch(console.error);
