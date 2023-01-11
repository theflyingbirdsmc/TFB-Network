import os
import pysftp

file_path = os.environ['FILE_PATHS'].split(" ")
print(str(file_path))

SFTP_TFB_PASSWORD = os.environ['SFTP_TFB_PASSWORD']
SFTP_TFB_LOBBY_USERNAME = os.environ['SFTP_TFB_LOBBY_USERNAME']
SFTP_TFB_FLAMECORD_USERNAME = os.environ['SFTP_TFB_FLAMECORD_USERNAME']
SFTP_TFB_TEST_USERNAME = os.environ['SFTP_TFB_TEST_USERNAME']

server_sftpusernames = {
    "TFB-Lobby": SFTP_TFB_LOBBY_USERNAME,
    "TFB-Flamecord": SFTP_TFB_FLAMECORD_USERNAME,
    "TFB-TEST": SFTP_TFB_TEST_USERNAME
}
for file in file_path:
    for server, username in server_sftpusernames.items():
        if server in file:
            print("I'm + " + server_sftpusernames[server] + "for the server " + server)
            with pysftp.Connection('germany01.theflyingbirds.net', username=server_sftpusernames[server], password=SFTP_TFB_PASSWORD, port=2022) as sftp:
                with sftp.cd('/home/container'):
                    sftp.put(file)  	# upload file to /home/container on remote