Vim�UnDo� ���V�����,���7������Yc|�Ѓ                                     [k�    _�                     
        ����                                                                                                                                                                                                                                                                                                                                                             [k    �   
             �   
          5�_�                           ����                                                                                                                                                                                                                                                                                                                                                             [k'    �                    PropTypes.string,�                !  entityId: PropTypes.oneOfType([�                7  entityType: PropTypes.oneOf(['products', 'trolley']),�                Conflict.propTypes = {�                 �                "Conflict.displayName = 'Conflict';�   
              �   	             )(ConflictComponent);�      
            })�      	          3    conflict: state.conflicts[entityType][entityId]�                )  (state, { entityType, entityId }) => ({�                const Conflict = connect(�                 �                4import ConflictComponent from 'components/Conflict';�                 �                #import PropTypes from 'prop-types';�                 &import { connect } from 'react-redux';�                    PropTypes.number,     ]),   };       export default Conflict;5�_�                    	        ����                                                                                                                                                                                                                                                                                                                            	   !       	           V   !    [k�    �              5�_�                             ����                                                                                                                                                                                                                                                                                                                            	   !       	           V   !    [kJ     �                 &import { connect } from 'react-redux';   #import PropTypes from 'prop-types';       4import ConflictComponent from 'components/Conflict';       const Conflict = connect(   )  (state, { entityType, entityId }) => ({   3    conflict: state.conflicts[entityType][entityId]     })   )(ConflictComponent);       Conflict.propTypes = {   7  entityType: PropTypes.oneOf(['products', 'trolley']),   !  entityId: PropTypes.oneOfType([       PropTypes.string,       PropTypes.number,     ]),   };       export default Conflict;5��