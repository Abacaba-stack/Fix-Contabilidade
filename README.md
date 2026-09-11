# 🛠️ Fix Contábil & Certificados - Ferramenta de Manutenção para Windows

> Script utilitário em Batch (`.bat`) para resolução automática de problemas com Certificados Digitais (A1/A3), travamentos no Spooler de Impressão e limpeza de cache temporário em ambientes contábeis e fiscais.

---

## 📌 Problemas Resolvidos

Departamentos contábeis enfrentam frequentemente paralisações operacionais devido a:
* **Travamento de Smart Card / Token (Certificados A3)**: Falhas intermitentes na comunicação com Tokens USB, leitores de Cartão Inteligente e drivers PKCS#11.
* **Fila de Impressão DANFE/NFe Presa**: Filas de impressão travadas por pré-visualizações de documentos corrompidos.
* **Erros de Autenticação em Portais Fiscais**: Estado corrompido da CAPI (Cryptographic API) e caches SSL/TLS que impedem o acesso aos portais do **e-CAC, Gov.br e SEFAZ**.
* **Travamento nos Validadores SPED / Sintegra**: Acúmulo de arquivos temporários que fazem os programas validadores fechar ou travar.

O `Fix_Contabil_Certificados.bat` automatiza todo o processo de reparo em segundos, sem a necessidade de gerenciar serviços manualmente ou reiniciar a máquina.

---

## 🚀 Funcionalidades

- 🔄 **Reinício dos Serviços de Smart Card**: Reinicia `SCardSvr` e `CertPropSvc` para forçar o sistema a reconhecer novamente Tokens A3 e Leitoras.
- 🧹 **Limpeza de Cache CAPI & SSL**: Utiliza o `certutil` para limpar estados criptográficos antigos e atualizar a cadeia local de certificados.
- 🖨️ **Purga da Fila de Impressão**: Paralisa o serviço de spooler com segurança, exclui arquivos órfãos (`.SHD` e `.SPL`) e reinicia o mecanismo de impressão.
- 🗑️ **Limpeza de Arquivos Temporários**: Elimina bloqueios nas pastas `%temp%` e `System32\Temp` relacionados a softwares de validação fiscal.
- 🛡️ **Auto-Verificação de Administrador**: Valida automaticamente se o script foi executado com privilégios elevados antes de iniciar.

---

## 📋 Pré-requisitos

* **Sistema Operacional**: Windows 10, Windows 11, Windows Server 2016 ou superior.
* **Permissões**: Privilégios de Administrador Local (`Executar como Administrador`).

1. **Baixe ou Clone** este repositório:
   ```cmd
   git clone [https://github.com/seu-usuario/Fix-Contabil-Certificados.git](https://github.com/seu-usuario/Fix-Contabil-Certificados.git)
