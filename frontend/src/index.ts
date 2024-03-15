import RWSClient, { RWSContainer } from 'rws-js-client';


import './styles/main.scss';

import routes from './routing/routes';

import { backendRoutes } from './backendImport';
import notifierMethod from './_notifier';
import initComponents from './application/_initComponents';

async function initializeApp() {
    const theClient = RWSContainer().get(RWSClient);

    theClient.setBackendRoutes(backendRoutes());
    theClient.enableRouting();
    theClient.addRoutes(routes);    
    
    theClient.onInit(async () => {
        initComponents();
    });    

    theClient.setNotifier(notifierMethod);
    theClient.assignClientToBrowser();   

    theClient.start((window as any)._RWS_CFG);
}

initializeApp().catch(console.error);
