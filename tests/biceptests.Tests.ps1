Describe 'Bicep Main Tests' {
    $bicepFiles = Get-ChildItem -Path . -Filter *.bicep

    foreach ($file in $bicepFiles) {
        It "Should compile $($file.Name) without errors" {
            { bicep build $file.FullName } | Should Not Throw
        }
    }
    AfterAll {
        $jsonFiles = Get-ChildItem -Path . -Filter *.json -Recurse
        foreach ($file in $jsonFiles) {
            if (Test-Path $file.FullName) {
                Remove-Item $file.FullName
            }
        }
    }
}

Describe 'Bicep Policy Definitions Tests' {
    $bicepFiles = Get-ChildItem -Path ./policy -Filter *.bicep

    foreach ($file in $bicepFiles) {
        It "Should compile $($file.Name) without errors" {
            { bicep build $file.FullName } | Should Not Throw
        }
    }
    AfterAll {
        $jsonFiles = Get-ChildItem -Path ./policy -Filter *.json -Recurse
        foreach ($file in $jsonFiles) {
            if (Test-Path $file.FullName) {
                Remove-Item $file.FullName
            }
        }
    }
}

Describe 'Bicep Assignment Tests' {
    $bicepFiles = Get-ChildItem -Path ./assignments -Filter *.bicep

    foreach ($file in $bicepFiles) {
        It "Should compile $($file.Name) without errors" {
            { bicep build $file.FullName } | Should Not Throw
        }
    }
    AfterAll {
        $jsonFiles = Get-ChildItem -Path ./assignments -Filter *.json -Recurse
        foreach ($file in $jsonFiles) {
            if (Test-Path $file.FullName) {
                Remove-Item $file.FullName
            }
        }
    }
}