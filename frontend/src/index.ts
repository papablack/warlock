import RWSClient, { RWSContainer, RWSPlugin, RWSPluginEntry } from '@rws-framework/client';
import { RWSBrowserRouter, BrowserRouterOpts } from '@rws-framework/browser-router';

import './styles/main.scss';

import routes from './routing/routes';

import backendImports from './backendImport';
import notifierMethod from './_notifier';
import _initComponents from './application/_initComponents';
import { loadRWSRichWindow } from '@rws-framework/client/src/interfaces/RWSWindow';


async function initializeApp() {
    const theClient = RWSContainer().get(RWSClient);

    theClient.setBackendRoutes(backendImports.backendRoutes());
    theClient.enableRouting();
        
    theClient.onInit(async () => {        
        RWSPlugin.getPlugin<RWSBrowserRouter>(RWSBrowserRouter).addRoutes(routes);
        _initComponents(theClient.appConfig.get('parted'));
    });    

    theClient.setNotifier(notifierMethod);
    theClient.assignClientToBrowser();   

    theClient.start({      
        partedPrefix: 'rws',  
        partedDirUrlPrefix: '/js',
        parted: true,
        plugins: [
            RWSBrowserRouter
        ]
    });  
}

initializeApp().catch(console.error);
