import RWSClient, { RWSContainer } from '@rws-framework/client';


import './styles/main.scss';


import backendImports from './backendImport';
import notifierMethod from './_notifier';

async function initializeApp() {
    const theClient = RWSContainer().get(RWSClient);

    theClient.setBackendRoutes(backendImports.backendRoutes());
    theClient.enableRouting();
    // theClient.addRoutes(routes);    
    
    theClient.onInit(async () => {
        // initComponents();
    });    

    theClient.setNotifier(notifierMethod);
    theClient.assignClientToBrowser();   

    await theClient.onDOMLoad();
    theClient.start((window as any)._RWS_CFG);
}

initializeApp().catch(console.error);
