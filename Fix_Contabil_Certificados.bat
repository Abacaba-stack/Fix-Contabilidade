@echo off
:: ============================================================================
:: Nome: Fix_Contabil_Certificados.bat
:: Descricao: Limpa caches de certificados digitais, destrava servicos A3/Token 
::            e purga filas de impressao de notas/DANFEs.
:: Requisito: Executar como Administrador.
:: ============================================================================

NET SESSION >nul 2>&1
if %errorLevel% neq 0 (
    echo [ERRO] Execute este arquivo como ADMINISTRADOR!
    pause
    exit /b 1
)

echo [1/4] Reiniciando servicos de Cartao Inteligente e Token (Certificados A3)...
net stop SCardSvr /y >nul 2>&1
net stop CertPropSvc /y >nul 2>&1
net start SCardSvr >nul 2>&1
net start CertPropSvc >nul 2>&1

echo [2/4] Limpando cache de Certificados SSL/TLS e estado da CAPI...
certutil -pulse >nul 2>&1
certutil -URLcache * delete >nul 2>&1

echo [3/4] Destravando impressao de DANFEs e relatorios contabeis...
net stop spooler /y >nul 2>&1
del /Q /F /S "%systemroot%\System32\Spool\Printers\*.*" >nul 2>&1
net start spooler >nul 2>&1

echo [4/4] Limpando arquivos temporarios que travam validadores (SPED / Sintegra)...
del /f /s /q "%temp%\*.tmp" >nul 2>&1
del /f /s /q "C:\Windows\Temp\*.tmp" >nul 2>&1

echo.
echo ============================================================================
echo [SUCESSO] Ambiente contabil e de certificados restaurado!
echo ============================================================================
pause