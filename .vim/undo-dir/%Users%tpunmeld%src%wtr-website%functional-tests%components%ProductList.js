Vim�UnDo� .�=^��<�+F������!�dV(g�8   5   0    const spinner = await this.spinnerVisible();   2   -      @       @   @   @    [u}�    _�                     $       ����                                                                                                                                                                                                                                                                                                                                                             [u0�     �   #   %   '      <    // const spinner = await this.page.$(selectors.spinner);5�_�                    %       ����                                                                                                                                                                                                                                                                                                                                                             [u0�    �   $   &   '          // spinner.hover();5�_�                    %       ����                                                                                                                                                                                                                                                                                                                                                             [u1�    �   $   &   '          spinner.hover();5�_�                    %       ����                                                                                                                                                                                                                                                                                                                                                             [u2     �   $   &   '          // spinner.hover();5�_�                    %       ����                                                                                                                                                                                                                                                                                                                                                             [u2    �   $   &   '           spinner.hover();5�_�                    %       ����                                                                                                                                                                                                                                                                                                                                                             [u23    �   $   &   '          spinner.hover();5�_�                    $       ����                                                                                                                                                                                                                                                                                                                                                             [u2�     �   $   &   (          �   $   &   '    5�_�      	              %   
    ����                                                                                                                                                                                                                                                                                                                                                             [u2�     �   $   &   (      1    await page.waitFor(<selector>,{visible:true})5�_�      
           	   %       ����                                                                                                                                                                                                                                                                                                                            %          %   %       v   %    [u2�     �   $   &   (      6    await this.page.waitFor(<selector>,{visible:true})5�_�   	              
   $       ����                                                                                                                                                                                                                                                                                                                            %          %   %       v   %    [u2�     �   #   %   (      9    const spinner = await this.page.$(selectors.spinner);5�_�   
                 %       ����                                                                                                                                                                                                                                                                                                                            %          %   %       v   %    [u2�     �   $   &   (      >    await this.page.waitFor(selecgtors.spinner,{visible:true})5�_�                    %   1    ����                                                                                                                                                                                                                                                                                                                            %          %   %       v   %    [u2�     �   $   &   (      N    const spinner = await this.page.waitFor(selecgtors.spinner,{visible:true})5�_�                    &       ����                                                                                                                                                                                                                                                                                                                            %          %   %       v   %    [u2�    �   %   '   (          // spinner.hover();5�_�                    &       ����                                                                                                                                                                                                                                                                                                                            %          %   %       v   %    [u2�    �   %   '   (          spinner.hover();5�_�                    %   M    ����                                                                                                                                                                                                                                                                                                                            %          %   %       v   %    [u3I     �   $   &   (      M    const spinner = await this.page.waitFor(selectors.spinner,{visible:true})5�_�                    $       ����                                                                                                                                                                                                                                                                                                                            %          %   %       v   %    [u3M    �   #   $          ;    //const spinner = await this.page.$(selectors.spinner);5�_�                            ����                                                                                                                                                                                                                                                                                                                            $          $   %       v   %    [uE3     �               '   'use strict';       Econst Component = require('../infrastructure/page-object/Component');   Aconst element = require('../infrastructure/page-object/element');   +const ProductPod = require('./ProductPod');       const selectors = {     wrapper: '#tSr',   +  pods: 'article[data-test="product-pod"]',   )  spinner: '[class^="spinnerContainer"]',   };       6module.exports = class ProductList extends Component {     constructor(page) {   $    super({ page, components: [] });       9    this.wrapper = element(this.page, selectors.wrapper);     }         async hasResults() {   4    const pods = element(this.page, selectors.pods);   !    await pods.waitForSelector();     }         async count() {   :    const podHandles = await this.page.$$(selectors.pods);       return podHandles.length;     }         async pods() {   :    const podHandles = await this.page.$$(selectors.pods);   B    return podHandles.map(podHandle => new ProductPod(podHandle));     }         async viewSpinner() {   N    const spinner = await this.page.waitFor(selectors.spinner,{visible:true});       await spinner.hover();     }   };5�_�                    	        ����                                                                                                                                                                                                                                                                                                                                                             [uR�     �   	      (        �   	      '    5�_�                    
       ����                                                                                                                                                                                                                                                                                                                            
          
          v       [uR�     �   	      (      5  $('article[data-test="product-pod"]:nth-child(19)')5�_�                    
       ����                                                                                                                                                                                                                                                                                                                            
          
          v       [uR�     �   	      (      <  nextPod: 'article[data-test="product-pod"]:nth-child(19)')5�_�                    
   B    ����                                                                                                                                                                                                                                                                                                                            
          
          v       [uR�     �   	      (      E  nextPod: index => 'article[data-test="product-pod"]:nth-child(19)')5�_�                    
   B    ����                                                                                                                                                                                                                                                                                                                            
          
          v       [uR�     �   	      (      F  nextPod: index => 'article[data-test="product-pod"]:nth-child(${})')5�_�                    
   M    ����                                                                                                                                                                                                                                                                                                                            
          
          v       [uR�     �   	      (      M  nextPod: index => 'article[data-test="product-pod"]:nth-child(${nextPod})')5�_�                    
       ����                                                                                                                                                                                                                                                                                                                            
          
          v       [uR�     �   	      (      M  nextPod: index => 'article[data-test="product-pod"]:nth-child(${nextPod})',�   
      (    5�_�                    
   B    ����                                                                                                                                                                                                                                                                                                                            
          
          v       [uR�     �   	      (      M  nextPod: index => `article[data-test="product-pod"]:nth-child(${nextPod})`,5�_�                    
       ����                                                                                                                                                                                                                                                                                                                            
          
          v       [uR�     �   	      (      K  nextPod: index => `article[data-test="product-pod"]:nth-child(${index})`,5�_�                    #        ����                                                                                                                                                                                                                                                                                                                            $          '          V       [uR�     �   "   '   (    �   #   $   (    5�_�                    "       ����                                                                                                                                                                                                                                                                                                                            (          +          V       [uR�     �   "   $   ,    5�_�                    $       ����                                                                                                                                                                                                                                                                                                                            )          ,          V       [uR�     �   #   %   -        async viewSpinner() {5�_�                    %       ����                                                                                                                                                                                                                                                                                                                            %          %          v       [uR�     �   $   &   -      N    const spinner = await this.page.waitFor(selectors.spinner,{visible:true});5�_�                     %       ����                                                                                                                                                                                                                                                                                                                            %          %          v       [uS     �   $   &   -      D    retur await this.page.waitFor(selectors.spinner,{visible:true});5�_�      !               &       ����                                                                                                                                                                                                                                                                                                                            %          %          v       [uS     �   %   &              await spinner.hover();5�_�       "           !   %       ����                                                                                                                                                                                                                                                                                                                            %          %          v       [uS     �   $   &   ,      >    await this.page.waitFor(selectors.spinner,{visible:true});5�_�   !   #           "   %   -    ����                                                                                                                                                                                                                                                                                                                            %          %          v       [uS     �   $   &   ,      E    return await this.page.waitFor(selectors.spinner,{visible:true});5�_�   "   %           #   $       ����                                                                                                                                                                                                                                                                                                                            %          %          v       [uS    �   #   %   ,        async podVisibleByIndex() {5�_�   #   &   $       %   *       ����                                                                                                                                                                                                                                                                                                                                                             [uuJ     �   *   ,   -          �   *   ,   ,    5�_�   %   '           &   +       ����                                                                                                                                                                                                                                                                                                                                                             [uuN   
 �   *   ,   -          return spinner5�_�   &   (           '   &       ����                                                                                                                                                                                                                                                                                                                                                             [uv     �   &   *   .        �   &   (   -    5�_�   '   )           (   +       ����                                                                                                                                                                                                                                                                                                                                                             [uv     �   *   ,   0        async viewSpinner() {5�_�   (   *           )   .       ����                                                                                                                                                                                                                                                                                                                                                             [uv     �   -   .              return spinner;5�_�   )   ,           *   ,       ����                                                                                                                                                                                                                                                                                                                                                             [uv     �   +   ,          N    const spinner = await this.page.waitFor(selectors.spinner,{visible:true});5�_�   *   -   +       ,   (       ����                                                                                                                                                                                                                                                                                                                                                             [uv     �   (   *   .    �   (   )   .    5�_�   ,   .           -   )       ����                                                                                                                                                                                                                                                                                                                            )          )          v       [uv     �   (   *   /      N    const spinner = await this.page.waitFor(selectors.spinner,{visible:true});5�_�   -   /           .   ,   
    ����                                                                                                                                                                                                                                                                                                                            )          )          v       [uv!    �   ,   .   0          �   ,   .   /    5�_�   .   0           /   -       ����                                                                                                                                                                                                                                                                                                                            )          )          v       [uvF    �   ,   .   0      *    const spinner = this.spinnerVisible();5�_�   /   1           0   *        ����                                                                                                                                                                                                                                                                                                                           '           /          V       [uy0     �   *   .   1        �   *   ,   0    5�_�   0   2           1   ,       ����                                                                                                                                                                                                                                                                                                                           '           2          V       [uy7     �   ,   .   3    �   ,   -   3    5�_�   1   3           2   -   B    ����                                                                                                                                                                                                                                                                                                                           '           3          V       [uyQ     �   ,   .   4      E    return await this.page.waitFor(selectors.spinner,{visible:true});5�_�   2   4           3   )   B    ����                                                                                                                                                                                                                                                                                                                           '           3          V       [uyk    �   (   *   4      E    return await this.page.waitFor(selectors.spinner,{visible:true});5�_�   3   5           4   -   -    ����                                                                                                                                                                                                                                                                                                                           '           3          V       [uy�     �   ,   .   4      T    return await this.page.waitFor(selectors.spinner,{visible:true, timeout: 1000});5�_�   4   6           5   -   5    ����                                                                                                                                                                                                                                                                                                                           '           3          V       [u|8    �   ,   .   4      V    return await this.page.waitFor(selectors.loadMorej,{visible:true, timeout: 1000});5�_�   5   7           6           ����                                                                                                                                                                                                                                                                                                                           '           3          V       [u|<     �   
      4    �         4    5�_�   6   8           7          ����                                                                                                                                                                                                                                                                                                                           (           4          V       [u|=     �         5      )  spinner: '[class^="spinnerContainer"]',5�_�   7   9           8          ����                                                                                                                                                                                                                                                                                                                           (           4          V       [u|�    �         5      0  loadMoreButton: '[class^="spinnerContainer"]',5�_�   8   :           9   .   5    ����                                                                                                                                                                                                                                                                                                                           (           4          V       [u|�    �   -   /   5      U    return await this.page.waitFor(selectors.loadMore,{visible:true, timeout: 1000});5�_�   9   ;           :   *       ����                                                                                                                                                                                                                                                                                                                           (           4          V       [u}�     �   )   +   5      T    return await this.page.waitFor(selectors.spinner,{visible:true, timeout: 1000});5�_�   :   <           ;   *   .    ����                                                                                                                                                                                                                                                                                                                           *   .       *   K       v   K    [u}�     �   )   +   5      N    return await this.page.$(selectors.spinner,{visible:true, timeout: 1000});5�_�   ;   =           <   )       ����                                                                                                                                                                                                                                                                                                                           *   .       *   K       v   K    [u}�     �   (   *   5        async spinnerVisible() {5�_�   <   >           =   -       ����                                                                                                                                                                                                                                                                                                                           *   .       *   K       v   K    [u}�     �   ,   .   5        async loadMoreVisible() {5�_�   =   ?           >   .       ����                                                                                                                                                                                                                                                                                                                           *   .       *   K       v   K    [u}�     �   -   /   5      [    return await this.page.waitFor(selectors.loadMoreButton,{visible:true, timeout: 1000});5�_�   >   @           ?   .   5    ����                                                                                                                                                                                                                                                                                                                           .   5       .   R       v   R    [u}�     �   -   /   5      U    return await this.page.$(selectors.loadMoreButton,{visible:true, timeout: 1000});5�_�   ?               @   2   -    ����                                                                                                                                                                                                                                                                                                                           .   5       .   R       v   R    [u}�    �   1   3   5      0    const spinner = await this.spinnerVisible();5�_�   *           ,   +   (       ����                                                                                                                                                                                                                                                                                                                                                             [uv     �   (   )   .    �   '   (   .      N    const spinner = await this.page.waitFor(selectors.spinner,{visible:true});5�_�   #           %   $   *       ����                                                                                                                                                                                                                                                                                                                                                             [uu,   	 �   )   +   ,      !    return await spinner.hover();5��