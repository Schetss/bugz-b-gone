using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for BLLlogin
/// </summary>
public class BLLlogin
{
    DALlogin DALlogin = new DALlogin();

    public List<ProductUser> checkLogin(ProductUser p_productuser)
    {
        return DALlogin.checkLogin(p_productuser);
    }

    public int getStatus(ProductUser p_status)
    {
        return DALlogin.getStatus(p_status);
    }

}
