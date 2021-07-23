#Author: Matheus Rodrigues
#Date: 15/07/2021
#Description: Algoritimo criado para mapear as unidades de redes quando o usuário faz login no AD. 


#parametros que podem ser passados 
param($directory = "", $address="" ,$letter="")

$user = ""
$pass = ""  

#concatena o endereco, ip mais o diretorio e adiciona na variavel fullpath
$fullPath=$address+$directory

try
{
    #objeto de rede 
    $net = new-object -ComObject WSCript.netWork 
    #mapnetworkdriver é o metodo reponsavel por mapear, primeiro parametro é a letra que será mapeada, 
    #segundo é o caminho, e o terceiro é a persistencia do mapeamentos
    $net.MapNetWorkDrive($letter,$fullPath,$false,$user,$pass)   
    if($?)
    {
        write-host 'Diretorio mapeado com sucesso'    
    }
}
catch
{
    write-host 'Nao foi possivel mapear a unidade '$letter
}



