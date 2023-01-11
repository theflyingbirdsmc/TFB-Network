import os

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
    # with pysftp.Connection('mc.theflyingbirds.net', username='', password='secret') as sftp:

    #     with sftp.cd('/allcode'):           # temporarily chdir to allcode
    #         sftp.put('/pycode/filename')  	# upload file to allcode/pycode on remote
    #         sftp.get('remote_file')         # get a remote file