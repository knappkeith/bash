import boto3
import sys
import os
import time

if __name__ == "__main__":
    profile = sys.argv[1]
    mySesh = boto3.Session(profile_name=profile)
    myCreds = mySesh.get_credentials()
    myCreds._refresh()
    os.system("printf {} | pbcopy".format(myCreds.access_key))
    a = input("Access Key Copied to Clipboard, Press Enter for Secret Key")
    os.system("printf {} | pbcopy".format(myCreds.secret_key))
    a = input("Secret Key Copied to Clipboard, Press Enter for Token")
    os.system("printf {} | pbcopy".format(myCreds.token))
    print("Token Copied to Clipboard, Thanks for Playing")
    while True:
        prev_access_key = str(myCreds.access_key)
        prev_secret_key = str(myCreds.secret_key)
        prev_token = str(myCreds.token)
        time.sleep(600)
        myCreds._refresh()
        print("{} Access Key Expires at: {}".format(myCreds.access_key, myCreds._expiry_time))
        if prev_access_key != myCreds.access_key:
            print("Access Key is different from Previous")
        if prev_secret_key != myCreds.secret_key:
            print("Secret Key is different from Previous")
        if prev_token != myCreds.token:
            print("Token is different from Previous")