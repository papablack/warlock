// import {RWSHTTPRoutingEntry} from '@rws-framework/server';

export default (): any[] => {
    return [    
        // {
        //     prefix: '/api',
        //     routes: [                
        //     ]
        // },        
        {
            name: 'home:index',
            path: '/*',
            noParams: true,
        },       
    ];
};