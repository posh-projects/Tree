@{
    RootModule = 'Tree.psm1'
    ModuleVersion = '1.0.1'
    GUID = '84d404ca-0f98-4d05-a2df-6c05caaa71d1'
    Author = 'n8tb1t'
    CompanyName = 'n8tb1t'
    Copyright = '(c) 2016 n8tb1t, licensed under MIT License.'
    Description = 'List contents of directories in a tree-like format with colorization and lots of options'
    PowerShellVersion = '5.0'
    HelpInfoURI = 'https://github.com/n8tb1t/Tree/blob/master/README.md'

    RequiredModules = @('ColoredText')

    FileList = @('Tree.psd1', 'Tree.psm1')

    FunctionsToExport = 'Get-ChildItemTree'
    AliasesToExport = 'tree'

    PrivateData = @{
        PSData = @{
            Tags = @('tree', 'color', 'file-system')
            LicenseUri = 'https://github.com/n8tb1t/Tree/blob/master/LICENSE'
            ProjectUri = 'https://github.com/n8tb1t/Tree'
            ReleaseNotes = '
Check out the project site for more information:
https://github.com/n8tb1t/Tree'
        }
    }
}
