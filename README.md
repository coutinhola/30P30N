#30P30N

No presente estudo foi utilizado o tutorial disponibilizado pela WolfDynamics (disponível em http://www.wolfdynamics.com/tutorials.html?id=119), incluindo a malha;

As simulações iniciais foram realizadas com as condições originais do caso disponibilizado pela WolfDynamics (Re 5000000 e ângulo de ataque 0º);

Posteriormente, novas simulações foram realizadas, mas com as alterações:

   - ângulo de ataque 5.5º, através das componentes **Ux**e **Uy** de corrente livre no arquivo *U* do diretório *0_org*, onde $Ux=Ucos(alpha)$ e $Uy=Usin(alpha)$
 
   - número de Reynolds 1710000, através do valor de **nu** no dicionário *transportProperties* do diretório *constant*, onde $nu=(cU)/Re$
    
O arquivo **run_30P30N_parallel** é o script utilizado para simular o caso no cluster computacional do Laboratório de Computação Científica (LCC) da UFSC-CTJ.
