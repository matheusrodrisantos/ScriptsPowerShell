
#Author: Matheus Rodrigues
#Date: 23/07/2021
#Description: Script para ingressar uma maquina no dominio 23/07/2021 
#reference: https://techexpert.tips/powershell/powershell-add-computers-domain/ 

param
(
    $username = $(throw "o nome do usuário do dominio e obrigatorio "),
    $pass     = $(throw "a senha do usuario do dominio e obrigatorio"),
    $ipdns    = "", 
    $dominio  = ""
)

try
{
    #altera o DNS de um adaptador -interfacealias é a referencia a um adaptador, pode ser wireless, virtualbox entre outros
    Set-DnsClientServerAddress -InterfaceAlias Ethernet -ServerAddresses $ipdns,8.8.8.8
    #cria uma forma segura para a senha
    [SecureString]$Securepassword = $pass| ConvertTo-SecureString -AsPlainText -Force 
    #cria um objeto Sytem Management e coloca na variavel de referência $credential 
    $credential = New-Object System.Management.Automation.PSCredential -ArgumentList $Username, $Securepassword
    #Adiciona o computador ao AD, domainame é o nome do dominio rccbrasil.local  
    Add-Computer –domainname $dominio -Credential $credential
    if($?)
    {
        write-host "computador adicionado ao dominio"
    }
}
catch
{
    Write-Host "Não foi possivel ingressar ao dominio"
}
