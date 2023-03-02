﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using _20T1020670.BusinessLayers;
using _20T1020670.DomainModels;


namespace _20T1020670.Web
{
    /// <summary>
    /// Cung caapshamf tiện ích liên quan đến SelectList
    /// </summary>
    public static class SellectistHelper
    {
        public static List<SelectListItem> Countries()
        {
            List<SelectListItem> list = new List<SelectListItem>();
            list.Add(new SelectListItem()
            {
                Value = "",
                Text = "--Chọn quốc gia --"
            });
            foreach(var item in CommonDataService.ListOfCountries())
            {
                list.Add(new SelectListItem(){
                    Value = item.CountryName,
                    Text = item.CountryName
                });
            }
            return list;
        }

        public static List<SelectListItem> Suppliers()
        {
            List<SelectListItem> list = new List<SelectListItem>();
            list.Add(new SelectListItem()
            {
                Value = "",
                Text = "--Chọn nhà cung cấp --"
            });
            foreach (var item in CommonDataService.ListOfSuppliers(""))
            {
                list.Add(new SelectListItem()
                {
                    Value = item.SupplierName,
                    Text = item.SupplierName
                });
            }
            return list;
        }

        public static List<SelectListItem> Categories()
        {
            List<SelectListItem> list = new List<SelectListItem>();
            list.Add(new SelectListItem()
            {
                Value = "",
                Text = "--Chọn Loại Hàng --"
            });
            foreach (var item in CommonDataService.ListOfCategories(""))
            {
                list.Add(new SelectListItem()
                {
                    Value = item.CategoryName,
                    Text = item.CategoryName
                });
            }
            return list;
        }
    }
}