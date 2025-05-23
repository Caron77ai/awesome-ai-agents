# 批量重命名 Lovart 图片脚本
# 用法：在 PowerShell 中 cd 到本目录，运行 .\rename-lovart-images.ps1

$mapping = @{
    "1f0ffe86e75ab2b24143be2132ed23b75b90c97d73676670910e7d9cd7fa335f.png" = "pixel-party.png"
    "3b6baeaa34c57d59c0c4ee3e2aa10d6fc961de2e567c85082b4f3c90609f0f20.png" = "marketing-meme-set.png"
    "3ffa66d71efee5590c2d79a604921564d4a4b9285e8c414e56ef7b0fbc429b75.png" = "pet-brand-design.png"
    "86b9a8a77a1eb2674e5f9a6db917ef8c5401ff127237ec37a6b26582770e13ad.png" = "bag-design.png"
    "648acd905386f6e30d98a5206dd8809cb648a163480bffd8766fe418c2b9857a.png" = "coffee-collection.png"
    "7761f159a4c87eee9c0df7744ad1831c68aacfe5ebc97eee25b64a617bc6a07.png" = "art-masterpiece.png"
}

foreach ($oldName in $mapping.Keys) {
    if (Test-Path $oldName) {
        Rename-Item $oldName $mapping[$oldName]
        Write-Host "$oldName -> $($mapping[$oldName])"
    } else {
        Write-Host "未找到文件：$oldName"
    }
} 