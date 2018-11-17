
def levantar_erro
  begin
    p ">>>>>>> Antes do Erro"
    File.open("abc.txt")
    p "Depois do Erro"
  rescue Errno::ENOENT
    p "Arquivo não existe..."
  rescue Exception => e
    p ">> Pode dar erro que eu continuo...#{e}"
  ensure
    p ">>>>>>>>> Isso é executado de qualquer forma, 'similar finally java'"
  end

end

levantar_erro