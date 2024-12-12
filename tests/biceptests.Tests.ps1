Describe 'Bicep Template Tests' {
    $bicepFiles = Get-ChildItem -Path . -Filter *.bicep

    foreach ($file in $bicepFiles) {
        It "Should compile $($file.Name) without errors" {
            { bicep build $file.FullName } | Should Not Throw
        }
    }
    AfterAll {
        $jsonFiles = Get-ChildItem -Path . -Filter *.json
        foreach ($file in $jsonFiles) {
            if (Test-Path $file) {
                Remove-Item $file
            }
        }
    }
}