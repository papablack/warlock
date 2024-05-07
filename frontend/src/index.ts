import RWSClient, { RWSContainer } from '@rws-framework/client';


import './styles/main.scss';

import routes from './routing/routes';

import backendImports from './backendImport';
import notifierMethod from './_notifier';
import _initComponents from './application/_initComponents';

async function initializeApp() {
    const theClient = RWSContainer().get(RWSClient);

    theClient.setBackendRoutes(backendImports.backendRoutes());
    theClient.enableRouting();
    theClient.addRoutes(routes);    
    
    theClient.onInit(async () => {
        _initComponents(theClient.appConfig.get('parted'));
    });    

    theClient.setNotifier(notifierMethod);
    theClient.assignClientToBrowser();   

    theClient.start({      
        partedPrefix: 'rws',  
        partedDirUrlPrefix: '/js',
        parted: true
    });  
}

initializeApp().catch(console.error);
