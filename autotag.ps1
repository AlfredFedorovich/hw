$url = "git@github.com:AlfredFedorovich/hw.git"
git clone -q $url
Set-Location C:\Users\alfkr\hw
$desc = git describe --tags

if ($desc.Contains("-")) {
    
    $tag=$desc.Remove($desc.IndexOf("-"))                 #забираем таг без -
    $split=$tag.Split(".")                                #разбиваем строку на массив
    $patch=[string]([int]$split[-1]+1)                    #добавляем 1 к патчу
    $newtag=$tag.Remove($tag.LastIndexOf(".")+1)+$patch   #создаем новый таг замещая в старом соледнее число
    $newtag
    git tag -a $newtag -m "New version"
    git push origin $newtag  ; git push --tags

           
} else {       
    Write-Host("No Changes")     
}
cd ..
Remove-Item C:\Users\alfkr\hw -Force -Recurse