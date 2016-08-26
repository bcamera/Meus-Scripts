Script | Função
-------|-------
atualizar-e-limpar | Script para primeira execução do Linux (baseado em Debian ou Ubuntu) para instalação de programas principais, atualização e limpeza.
-- | Desafio-STI https://github.com/bcamera/Meus-Scripts/tree/master/Linux#desafio-sti
busca-ip-incidente | Desafio-Graco https://github.com/bcamera/Meus-Scripts/tree/master/Linux#desafio-graco
instalar_zabbix_server | Sript de instalação e configuração do zabbix server 2.4 no SO Debian 8

#####Desafio-STI:
O DNS  utilizado para mapear nomes em registros de dados (ex: IPs, outros nomes, etc). A segurança do DNS pode ser incrementada com uso de DNSSEC, inclusive para garantia de no existncia de um nome, atravs do uso do tipo NSEC. Utilizando as ferramentas de consultas de DNS e o tipo de registro NSEC, escreva um script em shell-script (Linux / bash) ou windows batch (Windows) que, dado um domnio, liste todos os nomes daquele domnio. Opcionalmente, destaque os nomes que possuem endereço IPv6 associado. Exemplo (com destaque para ipv6):

prompt$ ./lista-nomes-dns.sh foobar.exemplo.com

foobar.exemplo.com

dns.foobar.exemplo.com

intranet.foobar.exemplo.com

mail.foobar.exemplo.com

www.foobar.exemplo.com ==>> 2001:db8:100::30

zimbra.foobar.exemplo.com

Exemplo (real, sada no completa):

prompt$ ./lista-nomes-dns.sh pop-ba.rnp.br

pop-ba.rnp.br ==>> 2801:86:0:4::19

adm-ufba.pop-ba.rnp.br

alpine.pop-ba.rnp.br

cert.bahia.pop-ba.rnp.br

...

Dica: consulte o DNS do google (8.8.8.8 ou 8.8.4.4)

-------------------------------------------------------------------------------------------------------------------------------

#####Desafio-Graco:
O tratamento de incidentes de segurança é divido em diversas fases,
cada uma com um conjunto de atividades específicas. Uma das fases é
conhecida como identificação, onde em uma rede com NAT deve-se buscar
a máquina interna que causou o incidente. Para essa atividade,
costuma-se utilizar scripts ou programas que fazem busca em logs do
firewall (arquivos de registros) para encontrar a ocorrência do incident
e.

Considere as linhas de log do firewall abaixo:

Mar 21 20:50:19 10.1.1.2 %ASA-0-305012: Teardown dynamic TCP
translation from academica:192.168.198.18/59656 to
outside:200.128.60.58/61684 duration 0:00:30

Mar 21 21:10:10 10.1.1.2 %ASA-0-305012: Teardown dynamic TCP
translation from academica:192.168.198.19/42893 to
outside:200.128.60.58/42748 duration 0:05:00

Mar 21 21:31:22 10.1.1.2 %ASA-0-305012: Teardown dynamic TCP
translation from academica:192.168.198.18/46170 to
outside:200.128.60.58/49370 duration 0:04:00

Mar 21 21:46:34 10.1.1.2 %ASA-0-305012: Teardown dynamic TCP
translation from academica:192.168.198.109/26608 to
outside:200.128.60.58/2961 duration 0:11:00

Mar 21 21:50:19 10.1.1.2 %ASA-0-305012: Teardown dynamic TCP
translation from academica:192.168.198.109/26523 to
outside:200.128.60.58/61684 duration 0:11:00

Mar 21 21:50:19 10.1.1.2 %ASA-0-305012: Teardown dynamic TCP
translation from academica:192.168.198.19/45484 to
outside:200.128.60.58/19834 duration 0:05:00

Faça um programa (em qualquer linguagem de programação) que encontre
qual IP interno (ex: 192.168.x.x) que foi responsável por determinada
conexão em determinado horário.

Exemplos de execução:

./busca-ip-incidente 200.128.60.58:19834 2016-03-21,21:48:39
- --> IP interno: 192.168.198.19

./busca-ip-incidente 200.128.60.58:61684 2016-03-21,20:50:00
- --> IP interno: 192.168.198.18

./busca-ip-incidente 200.128.60.58:61684 2016-03-21,21:42:00
- --> IP interno: nao encontrado!

Dica: a duração de uma conexão é um dado importante para saber seu
início e término.
