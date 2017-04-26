########################################################################
#                                                                      #
#   Arquivo: relatorio Conexões                    Data: 18/04/2017    #
#   Paulo Henrique de Andrade Vaz - Administrador de Redes             #
#             Relatório de Conexões de usuários na HPUX                #
#                                                                      #
#                                                                      #
#                                                                      #
#                                                                      #
#   Objetivo: Número Total de Usuários Simultâneos                     #
#             Número de Usuários de Conexão                            #
#             Número de Conexões por Usuários                          #
#                                                                      #
########################################################################

USER_SIMUL=$(who -R | wc -l)    # Número Total de Usuários Simultâneos
USER_CONEX=$(who -R | awk {'print $1'} | sort -u | wc -l)  # Número de Usuários de Conexão                          
who -R | awk {'print $1'} | sort -u > user_conex.txt

date
while read i; do
  user_conex_simult=$(who -R | awk {'print $1'} | grep $i | wc -l)
  echo 'Usuario: ' $i '->' $user_conex_simult 'Conexao(oes)' 
done < user_conex.txt

rm -rf user_conex.txt 

echo 'Numero Total de Usuarios Simultaneos: ' $USER_SIMUL
echo 'Numero de Usuarios de Conexoes: ' $USER_CONEX 

