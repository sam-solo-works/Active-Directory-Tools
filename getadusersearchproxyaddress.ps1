#Get-ADUser -LDAPFilter "(&(objectCategory=person)(objectClass=user)(|(proxyAddresses=*/o=test/ou=Exchange Administrative Group (test)/cn=Recipients/cn=test)))"

#Get-ADUser -LDAPFilter "(&(objectCategory=person)(objectClass=user)(|(proxyAddresses=*$testX500 )))"

Get-ADUser -LDAPFilter "(&(objectCategory=person)(objectClass=user)(|(proxyAddresses=*$ProxyAddresses)))"