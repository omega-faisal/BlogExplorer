import 'package:blogapp/models/category_models.dart';
import 'package:flutter/material.dart';

List<categorymodels> getcategories()  {
  List<categorymodels> categories =[];

  categorymodels categorymodel = categorymodels();

  //1
  categorymodel.categoryName = 'All';
  categorymodel.imageurl =
  'https://images.unsplash.com/photo-1513530534585-c7b1394c6d51?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2071&q=80';
    categories.add(categorymodel);


  //2
  categorymodel=categorymodels();
  categorymodel.categoryName='Business';
  categorymodel.imageurl='https://images.unsplash.com/photo-1519085360753-af0119f7cbe7?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1887&q=80';
  categories.add(categorymodel);

  //3
  categorymodel=categorymodels();
  categorymodel.categoryName='Merchants';
  categorymodel.imageurl='https://images.unsplash.com/photo-1545206085-d0e519bdcecd?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2071&q=80';
  categories.add(categorymodel);


  //4
  categorymodel=categorymodels();
  categorymodel.categoryName='Tutorials';
  categorymodel.imageurl='https://plus.unsplash.com/premium_photo-1661688733510-fc956e94ccbf?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2070&q=80';
  categories.add(categorymodel);

  return categories;
}