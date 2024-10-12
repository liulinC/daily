import XenAPI

session = XenAPI.Session('http://ip')
session.xenapi.login_with_password("user@domain", 'passwd', 'linfirst', 'linsecond')
print(session)
