Vim�UnDo� ��<�O����ֆ��f���n⌤�����{                                     [Ȁ�    _�                        0    ����                                                                                                                                                                                                                                                                                                                                                 V        [�E�     �               6Scenario('Product results appear on searching', I => {5�_�                       2    ����                                                                                                                                                                                                                                                                                                                                                 V        [�E�    �               7Scenario('Product results appear on searching', (I => {5�_�                       <    ����                                                                                                                                                                                                                                                                                                                                                 V        [�F%     �         	        �             5�_�                           ����                                                                                                                                                                                                                                                                                                                                               V       [�K]    �      	   	      B  I.see('shortcake biscuits', 'article[data-test="product-pod"]');5�_�                   	        ����                                                                                                                                                                                                                                                                                                                                      	           V        [�K�     �   	            �   	            5�_�                    	        ����                                                                                                                                                                                                                                                                                                                                      	           V        [�K�     �   	          5�_�         	                 ����                                                                                                                                                                                                                                                                                                                                      	           V        [�M�    �               C  I.see('shortfcake biscuits', 'article[data-test="product-pod"]');5�_�                           ����                                                                                                                                                                                                                                                                                                                                      	           V        [�Q=     �      	         C  I.see('shortfcake biscuits', 'article[data-test="product-pod"]');5�_�                    
        ����                                                                                                                                                                                                                                                                                                                           
                     V       [�Q?     �   	   
              DScenario('Product results appear on searching', (I, searchPage) => {   =  I.amOnPage('/ecom/shop/search?usestubs&nomonetate=omgyes');      searchPage.search('biscuits');   )  I.fillField('#searchTerm', 'biscuits');     I.click('#searchSubmit');   B  I.see('shortcake biscuits', 'article[data-test="product-pod"]');   });5�_�                            ����                                                                                                                                                                                                                                                                                                                                                 V        [�QC    �                )  I.fillField('#searchTerm', 'biscuits');     I.click('#searchSubmit');5�_�                           ����                                                                                                                                                                                                                                                                                                                                                 V        [�R    �               B  I.see('shortcake biscuits', 'article[data-test="product-pod"]');5�_�                            ����                                                                                                                                                                                                                                                                                                                                                V       [�R(     �             �             5�_�                           ����                                                                                                                                                                                                                                                                                                                	                                V       [�R,    �               C  I.see('shortfcake biscuits', 'article[data-test="product-pod"]');5�_�                            ����                                                                                                                                                                                                                                                                                                                
                                V        [�R�   	 �                    DScenario('Product results appear on searching', (I, searchPage) => {   =  I.amOnPage('/ecom/shop/search?usestubs&nomonetate=omgyes');      searchPage.search('biscuits');   B  I.see('shortcake biscuits', 'article[data-test="product-pod"]');   });5�_�                       0    ����                                                                                                                                                                                                                                                                                                                                                 V        [�Z�   
 �               DScenario('Product results appear on searching', (I, searchPage) => {5�_�                            ����                                                                                                                                                                                                                                                                                                                                                 V        [�u�     �                  Feature('Basic searching');       JScenario('Product results appear on searching', async (I, searchPage) => {   =  I.amOnPage('/ecom/shop/search?usestubs&nomonetate=omgyes');      searchPage.search('biscuits');   C  I.see('shortfcake biscuits', 'article[data-test="product-pod"]');   });5�_�                            ����                                                                                                                                                                                                                                                                                                                                                             [�y�     �                 �             5�_�                           ����                                                                                                                                                                                                                                                                                                                                                             [�y�    �                B  I.see('shortcake biscuits', 'article[data-test="product-pod"]');5�_�                            ����                                                                                                                                                                                                                                                                                                                                                             [Ȁ�     �                 �             5�_�                           ����                                                                                                                                                                                                                                                                                                                                                             [Ȁ�     �                 I.navigateTo();5�_�                            ����                                                                                                                                                                                                                                                                                                                                                             [Ȁ�    �                =  I.amOnPage('/ecom/shop/search?usestubs&nomonetate=omgyes');5�_�      
          	          ����                                                                                                                                                                                                                                                                                                                           
                      V        [�K�    �               B  I.see('shortcake biscuits', 'article[data-test="product-pod"]');5�_�   	               
   
        ����                                                                                                                                                                                                                                                                                                                           
           
           V        [�L�    �   	           5�_�                           ����                                                                                                                                                                                                                                                                                                                                       '       V       [�K�     �      
         'Scenario('Product results appear on searching', (I, searchPage) => { I.amOnPage('/ecom/shop/search?usestubs&nomonetate=omgyes'); searchPage.search('biscuits'); I.fillField('#searchTerm', 'biscuits'); I.click('#searchSubmit'); I.see('shortfcake biscuits', 'article[data-test="product-pod"]'); });5�_�                       #    ����                                                                                                                                                                                                                                                                                                                                       '       V       [�K�     �              �              'Scenario('Product results appear on searching', (I, searchPage) => { I.amOnPage('/ecom/shop/search?usestubs&nomonetate=omgyes'); searchPage.search('biscuits'); I.fillField('#searchTerm', 'biscuits'); I.click('#searchSubmit'); I.see('shortfcake biscuits', 'article[data-test="product-pod"]'); });5��