Vim�UnDo� ��*�?ð|��e��^�'� O`� ��AS          dialogshow();   	   
                       P��    _�                             ����                                                                                                                                                                                                                                                                                                                                                             P���     �                #include <QFont>5�_�                       	    ����                                                                                                                                                                                                                                                                                                                                                             P���     �               #include <QPushButton>5�_�                       	    ����                                                                                                                                                                                                                                                                                                                                                             P���    �               	#include 5�_�                    
       ����                                                                                                                                                                                                                                                                                                                                                             P��      �   	   
              quit.resize(75, 30);   2    quit.setFont(QFont("Times", 18, QFont::Bold));       C    QObject::connect(&quit, SIGNAL(clicked()), &app, SLOT(quit()));5�_�                    
        ����                                                                                                                                                                                                                                                                                                                                                             P��     �   	   
          	5�_�                           ����                                                                                                                                                                                                                                                                                                                                                             P��     �      	             QPushButton quit("Quit");5�_�                           ����                                                                                                                                                                                                                                                                                                                                                             P��     �      	             quit("Quit");5�_�      	                     ����                                                                                                                                                                                                                                                                                                                                                             P��)     �      	             FindDialog dialog("Quit");5�_�      
           	   
       ����                                                                                                                                                                                                                                                                                                                                                             P��5     �   	                quit.show();5�_�   	              
   	        ����                                                                                                                                                                                                                                                                                                                                                             P��=    �      	           5�_�   
                        ����                                                                                                                                                                                                                                                                                                                                                             P���     �      	             FindDialog dialog();5�_�                   	   
    ����                                                                                                                                                                                                                                                                                                                                                             P��b     �      
             dialog.show();5�_�                    	   
    ����                                                                                                                                                                                                                                                                                                                                                             P��c     �      
             dialogshow();5�_�                           ����                                                                                                                                                                                                                                                                                                                                                             P��l     �      	             FindDialog *dialog();5�_�                    	   
    ����                                                                                                                                                                                                                                                                                                                                                             P��o     �      
             dialogshow();5�_�                           ����                                                                                                                                                                                                                                                                                                                                                             P��     �      	             FindDialog dialog();5�_�                     	   
    ����                                                                                                                                                                                                                                                                                                                                                             P��    �      
             dialogshow();5�_�                          ����                                                                                                                                                                                                                                                                                                                                                             P���     �      	             FindDialog *dialog5�_�                           ����                                                                                                                                                                                                                                                                                                                                                             P���     �      	         (    FindDialog *dialog = new FindDialog;5�_�                     	       ����                                                                                                                                                                                                                                                                                                                                                             P���     �      
             dialog->show();5��