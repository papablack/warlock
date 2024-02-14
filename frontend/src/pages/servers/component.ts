import { RWSViewComponent, RWSView, observable, _ROUTING_EVENT_NAME, IRoutingEvent } from 'rws-js-client';

import EV from '../../events/events';

@RWSView('page-servers')
class ServersPage extends RWSViewComponent {  
  
  connectedCallback(): void 
  {
    super.connectedCallback();    
  }
}

ServersPage.defineComponent();

export { ServersPage }