#!/usr/bin/env /usr/local/opt/node@16/bin/node

import xbar, { separator, isDarkMode } from '@sindresorhus/xbar';
import { createConnection } from 'net';

// {"state":0,"remaining":0,"pauseduration":0,"count":0,"n_pomodoros":0}

const socket_path = `UNIX-CONNECT:${process.env.HOME}/.pomo/pomo.sock`;
console.log(socket_path);
const client = createConnection(socket_path)
        .on('connect', ()=>{
            console.log("Connected.");
        })
        // Messages are buffers. use toString
        .on('data', function(data) {
            data = data.toString();

            if(data === '__boop'){
                console.info('Server sent boop. Confirming our snoot is booped.');
                client.write('__snootbooped');
                return;
            }
            if(data === '__disconnect'){
                console.log('Server disconnected.')
                return cleanup();
            }

            // Generic message handler
            console.info('Server:', data)
        })
        .on('error', function(data) {
            console.error('Server not active.'); process.exit(1);
        })


// const out = `${ps.remaining}`;

// xbar([
//   {
//     text: out,
//     color: isDarkMode ? 'white' : 'red',
//     dropdown: false
//   },
//   separator,
//   {
//     text: 'Unicorns',
//     color: '#ff79d7',
//     submenu: [
//       {
//         text: ':tv: Video',
//         href: 'https://www.youtube.com/watch?v=9auOCbH5Ns4'
//       },
//       {
//         text: ':book: Wiki',
//         href: 'https://en.wikipedia.org/wiki/Unicorn'
//       }
//     ]
//   },
//   separator,
//   'Ponies'
// ]);

client.destroy();