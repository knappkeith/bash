import pyotp
import os
import sys


def my_code(seed):
    totp = pyotp.TOTP(seed)
    code = totp.now()
    return code


if __name__ == '__main__':
    if len(sys.argv) > 1:
        print(my_code(sys.argv[1]))
