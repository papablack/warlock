import os
import subprocess
from modules import launch_utils

current_file_directory = os.path.dirname(os.path.abspath(__file__))
parent_directory = os.path.dirname(current_file_directory)

sd_root_img_dir = '/text-generation-webui'

python = launch_utils.python
git = launch_utils.git
index_url = launch_utils.index_url
dir_repos = launch_utils.dir_repos

commit_hash = launch_utils.commit_hash
git_tag = launch_utils.git_tag

run = launch_utils.run

git_clone = launch_utils.git_clone
git_pull_recursive = launch_utils.git_pull_recursive
list_extensions = launch_utils.list_extensions
run_extension_installer = launch_utils.run_extension_installer
prepare_environment = launch_utils.prepare_environment

def clone_repo(link):
    if not link.strip():
        return  # Skip empty lines

    parsed_url = urlparse(link)

    if 'github.com' not in parsed_url.netloc:
        raise ValueError("URL is not a valid GitHub URL")

    # Split the path to get the repository part
    path_parts = parsed_url.path.strip('/').split('/')

    # Ensure the path has at least 2 parts (owner and repo)
    if len(path_parts) < 2:
        raise ValueError("URL does not contain a repository name")

    # The repository name is in the format 'owner/repo'
    repo_name = '/'.join(path_parts[:2])   

    if os.path.exists(sd_root_img_dir + '/extensions/' + repo_name):
        print(f"Extension from {repo_name} is already installed")
 
        return

    print(f"Cloning and installing extension from {link}")
    # Assuming the installation process involves cloning the repo
    subprocess.run(["git", "clone", link], check=True, cwd=sd_root_img_dir + '/extensions')
    # Add additional steps here if the installation process requires more than just cloning
    print(f"Successfully installed extension from {link}")


def get_extensions_from_file(file_path):
    with open(file_path, 'r') as file:
        return file.read().splitlines()


def install_automatic_sd_webui():
    print("Preparing Automatic 1111 SD WebUI...")
    with launch_utils.startup_timer.subcategory("prepare environment"):        
        prepare_environment()       
        print("Automatic 1111 SD WebUI has been installed.")

def install_extensions():   
    extensions_defaults_path = '/configs/sd_extensions_defaults.txt'
    custom_extensions_path = os.getenv('CUSTOM_EXTENSIONS')

    extensions = get_extensions_from_file(extensions_defaults_path)

    if custom_extensions_path:        
        if os.path.exists(custom_extensions_path):
            extensions.extend(get_extensions_from_file(custom_extensions_path)) 
        else:
            print(f"The file specified by 'CUSTOM_EXTENSIONS' does not exist: {custom_extensions_path}")

    for extension_link in extensions:
        clone_repo(extension_link)        

    install_automatic_sd_webui()        
                                
        
        