Vim�UnDo� ~�2���ew���D� � �?�X��,� 4�ܼ   
                                  [XF    _�                             ����                                                                                                                                                                                                                                                                                                                                                  V        [W��     �                 import Aws from 'aws-sdk'   import create from 'lib/create'       const initialiseAws = () => {   ,  Aws.config.update({ region: 'us-east-1' })   }       const initialiseDyanmo = () =>     new Aws.DynamoDB({   8    endpoint: new Aws.Endpoint('http://localhost:8000'),     })5�_�                            ����                                                                                                                                                                                                                                                                                                                                                  V        [W��     �                  5�_�                            ����                                                                                                                                                                                                                                                                                                                                                  V        [W��     �                  initialiseAws()   #  const dynamo = initialiseDyanmo()         await create(dynamo)5�_�                            ����                                                                                                                                                                                                                                                                                                                                                  V        [W��    �                 �             5�_�                            ����                                                                                                                                                                                                                                                                                                                                                             [W�j     �                "const executeasync = async () => {5�_�                            ����                                                                                                                                                                                                                                                                                                                                                             [W�k     �                #iconst executeasync = async () => {5�_�                            ����                                                                                                                                                                                                                                                                                                                                                             [W�l     �          	       �              5�_�      	                     ����                                                                                                                                                                                                                                                                                                                                                             [W��     �         	    5�_�      
           	          ����                                                                                                                                                                                                                                                                                                                                                             [W��     �                  console.log('graph')5�_�   	              
           ����                                                                                                                                                                                                                                                                                                                                                             [W��    �         
        �         	    5�_�   
                         ����                                                                                                                                                                                                                                                                                                                                                             [XF
    �         
        init()5��