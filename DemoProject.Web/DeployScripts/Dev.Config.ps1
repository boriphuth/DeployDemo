$config = @{
    ApplicationPools = @(
        @{
            Name = "DemoSiteAppPool";
            FrameworkVersion = "v4.0"
        },
        @{
            Name = "DemoSiteAppAppPool";
            FrameworkVersion = "v4.0"
        });
    Site = @{
        Name = "DemoSite";
        SiteRoot = "c:\tmp";
        AppPoolName = "DemoSiteAppPool";
        Port = 87
        Bindings = @(
            @{Port= 87; HostName= "*"}, 
            @{Port= 89; HostName= "DemoApp"}
        );
        Application = @{
            Name = "DemoApp";
            AppPoolName = "DemoSiteAppAppPool";
            ApplicationRoot = "c:\tmp"
        }
    };
}