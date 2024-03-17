const path = require('path');
const { rwsShell } = require('@rws-framework/console');
const chalk = require('chalk');

const runCommand = rwsShell.runCommand;

async function afterInstall(){
    if(process.env.warlock_NO_LIFECYCLE === 'Yes' ){
        console.error('warlock ignoring postinstall');
        return;
    }

    await runCommand("rws init", path.resolve(__dirname, 'backend'));
    await runCommand("yarn build", path.resolve(__dirname, 'backend'));

    await runCommand("rws-client init", path.resolve(__dirname, 'backend'));
    await runCommand("yarn build", path.resolve(__dirname, 'frontend'));
}

afterInstall().then(() => {
    console.log(chalk.yellowBright('-----------------------------------------------------------'));
    console.log(chalk.green.bold('[RWS] has been installed, configured and built successfully. You\'re good to go!'));
    console.log(`To start server run ${chalk.red('"yarn dev"')} from ${chalk.blueBright('"' + path.resolve(__dirname, 'backend') + '"')}`);
});