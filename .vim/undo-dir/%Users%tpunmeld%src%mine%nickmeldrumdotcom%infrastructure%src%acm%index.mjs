Vim�UnDo� U�0��J�t�pp+�:��X�<<����LgY   c                                  [�0�    _�                            ����                                                                                                                                                                                                                                                                                                                                                             [�*     �      !   h        �      !   g    5�_�                    %       ����                                                                                                                                                                                                                                                                                                                                                             [�*     �   %   '   i          �   %   '   h    5�_�                    &       ����                                                                                                                                                                                                                                                                                                                &                     i           V        [�*    �   %   '   i        8?5�_�                    &       ����                                                                                                                                                                                                                                                                                                                &                     i           V        [�*p     �   %   &            */5�_�                             ����                                                                                                                                                                                                                                                                                                                                      h           V        [�*r     �                   /*5�_�                    d       ����                                                                                                                                                                                                                                                                                                                                      g           V        [�*z    �   b   d           �   a   c            )�   `   b          H    '## update stack template with cert arn (updating as necessary) ##',�   _   a            console.log(�   ^   `            await init()�   ]   _          export default async () => {�   \   ^           �   [   ]          }�   Z   \          #  return matchedCert.CertificateArn�   Y   [            // valid cert - use it!�   X   Z            }�   W   Y          '    return importDetails.CertificateArn�   V   X              console.log(importDetails)�   U   W           �   T   V                .promise()�   S   U                })�   R   T          7        CertificateChain: downloadedCert.data.chain[0],�   Q   S          4        PrivateKey: privateKeyData.data.private_key,�   P   R          0        Certificate: downloadedCert.data.server,�   O   Q          T        // CertificateArn: matchedCert.CertificateArn, // to overwrite existing cert�   N   P                .importCertificate({�   M   O          #    const importDetails = await acm�   L   N          /    console.log('importing new cert to acm...')�   K   M           �   J   L              )�   I   K                latestIssued.id,�   H   J                 config.dnsimpleDomainName,�   G   I                config.dnsimpleAccountId,�   F   H          N    const privateKeyData = await client.certificates.getCertificatePrivateKey(�   E   G           �   D   F              )�   C   E                latestIssued.id,�   B   D                 config.dnsimpleDomainName,�   A   C                config.dnsimpleAccountId,�   @   B          I    const downloadedCert = await client.certificates.downloadCertificate(�   ?   A              console.log(latestIssued)�   >   @              )�   =   ?          9      i => Number(new Date(i.expires_on)) === latestDate,�   <   >          3    const latestIssued = issuedAndRightDomain.find(�   ;   =              )�   :   <          ?      ...issuedAndRightDomain.map(i => new Date(i.expires_on)),�   9   ;               const latestDate = Math.max(�   8   :              )�   7   9          ,        new Date(c.expires_on) > new Date(),�   6   8                  c.state === 'issued' &&�   5   7          2        c.common_name === 'www.nickmeldrum.com' &&�   4   6          
      c =>�   3   5          ;    const issuedAndRightDomain = dnsimpleCerts.data.filter(�   2   4              )�   1   3                 config.dnsimpleDomainName,�   0   2                config.dnsimpleAccountId,�   /   1          E    const dnsimpleCerts = await client.certificates.listCertificates(�   .   0           �   -   /              })�   ,   .          .      accessToken: process.env.DNSIMPLE_TOKEN,�   +   -              const client = dnsimple({�   *   ,          0    console.log('getting cert from dnsimple...')�   )   +          +  if (timeToCheck > matchedCert.NotAfter) {�   (   *          ?  const timeToCheck = new Date(new Date().getTime() + twoWeeks)�   '   )          +  const twoWeeks = 1000 * 60 * 60 * 24 * 28�   &   (           �   %   '          2  const matchedCert = matchingCerts[1].Certificate�   $   &           �   #   %              )�   "   $          >      `expected 1 matching cert, got ${matchingCerts.length}`,�   !   #              throw new Error(�       "          3    // todo once moved onto prod - this should be 1�      !          !  if (matchingCerts.length !== 2)�                   )�                    ),�                        .promise(),�                
        })�                +          CertificateArn: c.CertificateArn,�                        .describeCertificate({�                	      acm�                    ).map(async c =>�                9      c => c.DomainName === config.certificateDomainName,�                (    certs.CertificateSummaryList.filter(�                *  const matchingCerts = await Promise.all(�                  console.log(certs)�                    .promise()�                    })�                &      CertificateStatuses: ['ISSUED'],�                    .listCertificates({�                  const certs = await acm�                'const getCertificateArn = async () => {�                 �                }�   
               acm = new Aws.ACM({})�   	               config = await getConfig()�      
            if (acm) return�      	          const init = async () => {�                 �                let acm�                
let config�                 �                "import getConfig from 'src/config'�                import dnsimple from 'dnsimple'�                 import Aws from 'aws-sdk'�   c   d          '  const arn = await getCertificateArn()     console.log(arn)     return arn   }5�_�                       $    ����                                                                                                                                                                                                                                                                                                                                      d           V        [�*�    �         c      &      CertificateStatuses: ['ISSUED'],5�_�      	                      ����                                                                                                                                                                                                                                                                                                                           +          +   ,       v   ,    [�+�    �      !   c      !  if (matchingCerts.length !== 2)5�_�      
           	   $   $    ����                                                                                                                                                                                                                                                                                                                           +          +   ,       v   ,    [�+�    �   #   %   c      2  const matchedCert = matchingCerts[1].Certificate5�_�   	              
   )   %    ����                                                                                                                                                                                                                                                                                                                           +          +   ,       v   ,    [�+�     �   )   +   d          �   )   +   c    5�_�   
                 *        ����                                                                                                                                                                                                                                                                                                                           ,          ,   ,       v   ,    [�+�     �   )   +              log5�_�                    *       ����                                                                                                                                                                                                                                                                                                                           ,          ,   ,       v   ,    [�+�     �   )   +              �   *   +   d    5�_�                    *       ����                                                                                                                                                                                                                                                                                                                           *          *          v       [�,      �   )   +   d          console.log('info', obj)5�_�                    *       ����                                                                                                                                                                                                                                                                                                                           *          *   !       v   !    [�,    �   )   +   d      #    console.log('dnsimplekey', obj)5�_�                    *       ����                                                                                                                                                                                                                                                                                                                           ,          ,   ,       v   ,    [�0�    �   )   *          :    console.log('dnsimplekey', process.env.DNSIMPLE_TOKEN)5�_�                   ,       ����                                                                                                                                                                                                                                                                                                                           ,          ,   ,       v   ,    [�,s     �   +   -   d            accessToken: ,5�_�                    ,       ����                                                                                                                                                                                                                                                                                                                           ,          ,   ,       v   ,    [�,v     �   +   -   d            accessToken: '',5�_�                   ,       ����                                                                                                                                                                                                                                                                                                                           '          (          V       [�,}    �   ,   -   d    �   +   -   d      6      accessToken: 'Lx6aRlqttnLZuWh9n55AiTRaDZsG43NH',5�_�                     *       ����                                                                                                                                                                                                                                                                                                                           '          (          V       [�0�     �   )   +        5�_�                    ,       ����                                                                                                                                                                                                                                                                                                                           ,          ,   ,       v   ,    [�,|     �   ,   -   d    �   +   -   d      6      accessToken: Lx6aRlqttnLZuWh9n55AiTRaDZsG43NH'',5��