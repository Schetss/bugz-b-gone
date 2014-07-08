using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(Bugz.Startup))]
namespace Bugz
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
