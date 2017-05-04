require 'test_helper'

describe Recipe do
  it "requires both recipe label and uri to initialize" do
    proc {
      Recipe.new
    }.must_raise ArgumentError

    proc {
      Recipe.new({"label" => "monster bread"})
    }.must_raise ArgumentError
  end

  it "can create a Recipe instance" do
   recipe = Recipe.new ({"label" => "monster bread", "uri" => "http://www.edamam.com/ontologies/edamam.owl#recipe_b6965e7f8e815e4e69d75ef773cda095"})
   recipe.class.must_equal Recipe
  end

    let(:recipe_hash) { {
      "uri" => "http://www.edamam.com/ontologies/edamam.owl#recipe_c748acc6945e3ed9b8e46d6f6489f781",
      "label" => "Ham, Cheese, and Pickle Skewers",
      "image" => "https://www.edamam.com/web-img/5bc/5bc9890a55411da589e654974243ed00.jpg",
      "source" => "Martha Stewart",
      "url" => "http://www.marthastewart.com/354962/ham-cheese-and-pickle-skewers",
      "shareAs" => "http://www.edamam.com/recipe/ham-cheese-and-pickle-skewers-c748acc6945e3ed9b8e46d6f6489f781/ham",
      "yield" => 4.0,
      "dietLabels" => [ "Low-Carb" ],
      "healthLabels" => [ "Gluten-Free", "Egg-Free", "Peanut-Free", "Tree-Nut-Free", "Soy-Free", "Fish-Free", "Shellfish-Free" ],
      "cautions" => [ ],
      "ingredientLines" => [ "1 cup finely grated swiss cheese, preferably emmental (6 ounces)", "8 slices cooked ham (8 ounces)", "Vegetable oil, for brushing", "1 large dill pickle, cut into 1/2-inch-thick half-moons" ],
      "ingredients" => [ {
        "text" => "1 cup finely grated swiss cheese, preferably emmental (6 ounces)",
        "weight" => 170.09713745117188
      }, {
        "text" => "8 slices cooked ham (8 ounces)",
        "weight" => 226.7961883544922
      }, {
        "text" => "Vegetable oil, for brushing",
        "weight" => 6.502749230957031
      }, {
        "text" => "1 large dill pickle, cut into 1/2-inch-thick half-moons",
        "weight" => 81.25
      } ],
      "calories" => 1083.2812125339356,
      "totalWeight" => 484.6460750366211,
      "totalNutrients" => {
        "ENERC_KCAL" => {
          "label" => "Energy",
          "quantity" => 1083.2812125339356,
          "unit" => "kcal"
        },
        "FAT" => {
          "label" => "Fat",
          "quantity" => 73.53797564086915,
          "unit" => "g"
        },
        "FASAT" => {
          "label" => "Saturated",
          "quantity" => 37.387887659959354,
          "unit" => "g"
        },
        "FATRN" => {
          "label" => "Trans",
          "quantity" => 0.049876086601440425,
          "unit" => "g"
        },
        "FAMS" => {
          "label" => "Monounsaturated",
          "quantity" => 26.933028518011106,
          "unit" => "g"
        },
        "FAPU" => {
          "label" => "Polyunsaturated",
          "quantity" => 4.653731165651367,
          "unit" => "g"
        },
        "CHOCDF" => {
          "label" => "Carbs",
          "quantity" => 19.795645008850098,
          "unit" => "g"
        },
        "FIBTG" => {
          "label" => "Fiber",
          "quantity" => 3.7608504486083985,
          "unit" => "g"
        },
        "SUGAR" => {
          "label" => "Sugars",
          "quantity" => 3.1146572143554687,
          "unit" => "g"
        },
        "PROCNT" => {
          "label" => "Protein",
          "quantity" => 83.86157638244629,
          "unit" => "g"
        },
        "CHOLE" => {
          "label" => "Cholesterol",
          "quantity" => 285.76319381713864,
          "unit" => "mg"
        },
        "NA" => {
          "label" => "Sodium",
          "quantity" => 3368.6609291076657,
          "unit" => "mg"
        },
        "CA" => {
          "label" => "Calcium",
          "quantity" => 1446.2119424438476,
          "unit" => "mg"
        },
        "MG" => {
          "label" => "Magnesium",
          "quantity" => 120.21957366943359,
          "unit" => "mg"
        },
        "K" => {
          "label" => "Potassium",
          "quantity" => 876.9423564147949,
          "unit" => "mg"
        },
        "FE" => {
          "label" => "Iron",
          "quantity" => 2.8647653961181643,
          "unit" => "mg"
        },
        "ZN" => {
          "label" => "Zinc",
          "quantity" => 10.55923373565674,
          "unit" => "mg"
        },
        "P" => {
          "label" => "Phosphorus",
          "quantity" => 1324.4489375305175,
          "unit" => "mg"
        },
        "VITA_RAE" => {
          "label" => "Vitamin A",
          "quantity" => 379.0887023925781,
          "unit" => "µg"
        },
        "VITC" => {
          "label" => "Vitamin C",
          "quantity" => 10.940597534179688,
          "unit" => "mg"
        },
        "THIA" => {
          "label" => "Thiamin (B1)",
          "quantity" => 1.5634678356933593,
          "unit" => "mg"
        },
        "RIBF" => {
          "label" => "Riboflavin (B2)",
          "quantity" => 0.9534972421264647,
          "unit" => "mg"
        },
        "NIA" => {
          "label" => "Niacin (B3)",
          "quantity" => 6.831213176269531,
          "unit" => "mg"
        },
        "VITB6A" => {
          "label" => "Vitamin B6",
          "quantity" => 0.9157775837707519,
          "unit" => "mg"
        },
        "FOLDFE" => {
          "label" => "Folate (Equivalent)",
          "quantity" => 32.581561431884765,
          "unit" => "µg"
        },
        "VITB12" => {
          "label" => "Vitamin B12",
          "quantity" => 6.6337883819580075,
          "unit" => "µg"
        },
        "VITD" => {
          "label" => "Vitamin D",
          "quantity" => 2.4380590057373044,
          "unit" => "µg"
        },
        "TOCPHA" => {
          "label" => "Vitamin E",
          "quantity" => 2.2697804053466797,
          "unit" => "mg"
        },
        "VITK1" => {
          "label" => "Vitamin K",
          "quantity" => 18.308678436279298,
          "unit" => "µg"
        }
      },
      "totalDaily" => {
        "ENERC_KCAL" => {
          "label" => "Energy",
          "quantity" => 54.16406062669678,
          "unit" => "%"
        },
        "FAT" => {
          "label" => "Fat",
          "quantity" => 113.1353471397987,
          "unit" => "%"
        },
        "FASAT" => {
          "label" => "Saturated",
          "quantity" => 186.9394382997968,
          "unit" => "%"
        },
        "CHOCDF" => {
          "label" => "Carbs",
          "quantity" => 6.598548336283366,
          "unit" => "%"
        },
        "FIBTG" => {
          "label" => "Fiber",
          "quantity" => 15.043401794433594,
          "unit" => "%"
        },
        "PROCNT" => {
          "label" => "Protein",
          "quantity" => 167.72315276489257,
          "unit" => "%"
        },
        "CHOLE" => {
          "label" => "Cholesterol",
          "quantity" => 95.25439793904621,
          "unit" => "%"
        },
        "NA" => {
          "label" => "Sodium",
          "quantity" => 140.36087204615274,
          "unit" => "%"
        },
        "CA" => {
          "label" => "Calcium",
          "quantity" => 144.62119424438475,
          "unit" => "%"
        },
        "MG" => {
          "label" => "Magnesium",
          "quantity" => 30.0548934173584,
          "unit" => "%"
        },
        "K" => {
          "label" => "Potassium",
          "quantity" => 25.05549589756557,
          "unit" => "%"
        },
        "FE" => {
          "label" => "Iron",
          "quantity" => 15.915363311767578,
          "unit" => "%"
        },
        "ZN" => {
          "label" => "Zinc",
          "quantity" => 70.39489157104494,
          "unit" => "%"
        },
        "P" => {
          "label" => "Phosphorus",
          "quantity" => 189.20699107578824,
          "unit" => "%"
        },
        "VITA_RAE" => {
          "label" => "Vitamin A",
          "quantity" => 42.12096693250868,
          "unit" => "%"
        },
        "VITC" => {
          "label" => "Vitamin C",
          "quantity" => 18.234329223632812,
          "unit" => "%"
        },
        "THIA" => {
          "label" => "Thiamin (B1)",
          "quantity" => 104.23118904622396,
          "unit" => "%"
        },
        "RIBF" => {
          "label" => "Riboflavin (B2)",
          "quantity" => 56.08807306626263,
          "unit" => "%"
        },
        "NIA" => {
          "label" => "Niacin (B3)",
          "quantity" => 34.15606588134766,
          "unit" => "%"
        },
        "VITB6A" => {
          "label" => "Vitamin B6",
          "quantity" => 45.78887918853759,
          "unit" => "%"
        },
        "FOLDFE" => {
          "label" => "Folate (Equivalent)",
          "quantity" => 8.145390357971191,
          "unit" => "%"
        },
        "VITB12" => {
          "label" => "Vitamin B12",
          "quantity" => 110.56313969930012,
          "unit" => "%"
        },
        "VITD" => {
          "label" => "Vitamin D",
          "quantity" => 0.6095147514343261,
          "unit" => "%"
        },
        "TOCPHA" => {
          "label" => "Vitamin E",
          "quantity" => 11.348902026733398,
          "unit" => "%"
        },
        "VITK1" => {
          "label" => "Vitamin K",
          "quantity" => 22.88584804534912,
          "unit" => "%"
        }
      },
      "digest" => [ {
        "label" => "Fat",
        "tag" => "FAT",
        "schemaOrgTag" => "fatContent",
        "total" => 73.53797564086915,
        "hasRDI" => true,
        "daily" => 113.1353471397987,
        "unit" => "g",
        "sub" => [ {
          "label" => "Saturated",
          "tag" => "FASAT",
          "schemaOrgTag" => "saturatedFatContent",
          "total" => 37.387887659959354,
          "hasRDI" => true,
          "daily" => 186.9394382997968,
          "unit" => "g"
        }, {
          "label" => "Trans",
          "tag" => "FATRN",
          "schemaOrgTag" => "transFatContent",
          "total" => 0.049876086601440425,
          "hasRDI" => false,
          "daily" => 0.0,
          "unit" => "g"
        }, {
          "label" => "Monounsaturated",
          "tag" => "FAMS",
          "schemaOrgTag" => nil,
          "total" => 26.933028518011106,
          "hasRDI" => false,
          "daily" => 0.0,
          "unit" => "g"
        }, {
          "label" => "Polyunsaturated",
          "tag" => "FAPU",
          "schemaOrgTag" => nil,
          "total" => 4.653731165651367,
          "hasRDI" => false,
          "daily" => 0.0,
          "unit" => "g"
        } ]
      }, {
        "label" => "Carbs",
        "tag" => "CHOCDF",
        "schemaOrgTag" => "carbohydrateContent",
        "total" => 19.795645008850098,
        "hasRDI" => true,
        "daily" => 6.598548336283366,
        "unit" => "g",
        "sub" => [ {
          "label" => "Carbs (net)",
          "tag" => "CHOCDF.net",
          "schemaOrgTag" => nil,
          "total" => 16.0347945602417,
          "hasRDI" => false,
          "daily" => 0.0,
          "unit" => "g"
        }, {
          "label" => "Fiber",
          "tag" => "FIBTG",
          "schemaOrgTag" => "fiberContent",
          "total" => 3.7608504486083985,
          "hasRDI" => true,
          "daily" => 15.043401794433594,
          "unit" => "g"
        }, {
          "label" => "Sugars",
          "tag" => "SUGAR",
          "schemaOrgTag" => "sugarContent",
          "total" => 3.1146572143554687,
          "hasRDI" => false,
          "daily" => 0.0,
          "unit" => "g"
        } ]
      }, {
        "label" => "Protein",
        "tag" => "PROCNT",
        "schemaOrgTag" => "proteinContent",
        "total" => 83.86157638244629,
        "hasRDI" => true,
        "daily" => 167.72315276489257,
        "unit" => "g"
      }, {
        "label" => "Cholesterol",
        "tag" => "CHOLE",
        "schemaOrgTag" => "cholesterolContent",
        "total" => 285.76319381713864,
        "hasRDI" => true,
        "daily" => 95.25439793904621,
        "unit" => "mg"
      }, {
        "label" => "Sodium",
        "tag" => "NA",
        "schemaOrgTag" => "sodiumContent",
        "total" => 3368.6609291076657,
        "hasRDI" => true,
        "daily" => 140.36087204615274,
        "unit" => "mg"
      }, {
        "label" => "Calcium",
        "tag" => "CA",
        "schemaOrgTag" => nil,
        "total" => 1446.2119424438476,
        "hasRDI" => true,
        "daily" => 144.62119424438475,
        "unit" => "mg"
      }, {
        "label" => "Magnesium",
        "tag" => "MG",
        "schemaOrgTag" => nil,
        "total" => 120.21957366943359,
        "hasRDI" => true,
        "daily" => 30.0548934173584,
        "unit" => "mg"
      }, {
        "label" => "Potassium",
        "tag" => "K",
        "schemaOrgTag" => nil,
        "total" => 876.9423564147949,
        "hasRDI" => true,
        "daily" => 25.05549589756557,
        "unit" => "mg"
      }, {
        "label" => "Iron",
        "tag" => "FE",
        "schemaOrgTag" => nil,
        "total" => 2.8647653961181643,
        "hasRDI" => true,
        "daily" => 15.915363311767578,
        "unit" => "mg"
      }, {
        "label" => "Zinc",
        "tag" => "ZN",
        "schemaOrgTag" => nil,
        "total" => 10.55923373565674,
        "hasRDI" => true,
        "daily" => 70.39489157104494,
        "unit" => "mg"
      }, {
        "label" => "Phosphorus",
        "tag" => "P",
        "schemaOrgTag" => nil,
        "total" => 1324.4489375305175,
        "hasRDI" => true,
        "daily" => 189.20699107578824,
        "unit" => "mg"
      }, {
        "label" => "Vitamin A",
        "tag" => "VITA_RAE",
        "schemaOrgTag" => nil,
        "total" => 379.0887023925781,
        "hasRDI" => true,
        "daily" => 42.12096693250868,
        "unit" => "µg"
      }, {
        "label" => "Vitamin C",
        "tag" => "VITC",
        "schemaOrgTag" => nil,
        "total" => 10.940597534179688,
        "hasRDI" => true,
        "daily" => 18.234329223632812,
        "unit" => "mg"
      }, {
        "label" => "Thiamin (B1)",
        "tag" => "THIA",
        "schemaOrgTag" => nil,
        "total" => 1.5634678356933593,
        "hasRDI" => true,
        "daily" => 104.23118904622396,
        "unit" => "mg"
      }, {
        "label" => "Riboflavin (B2)",
        "tag" => "RIBF",
        "schemaOrgTag" => nil,
        "total" => 0.9534972421264647,
        "hasRDI" => true,
        "daily" => 56.08807306626263,
        "unit" => "mg"
      }, {
        "label" => "Niacin (B3)",
        "tag" => "NIA",
        "schemaOrgTag" => nil,
        "total" => 6.831213176269531,
        "hasRDI" => true,
        "daily" => 34.15606588134766,
        "unit" => "mg"
      }, {
        "label" => "Vitamin B6",
        "tag" => "VITB6A",
        "schemaOrgTag" => nil,
        "total" => 0.9157775837707519,
        "hasRDI" => true,
        "daily" => 45.78887918853759,
        "unit" => "mg"
      }, {
        "label" => "Folate (Equivalent)",
        "tag" => "FOLDFE",
        "schemaOrgTag" => nil,
        "total" => 32.581561431884765,
        "hasRDI" => true,
        "daily" => 8.145390357971191,
        "unit" => "µg"
      }, {
        "label" => "Vitamin B12",
        "tag" => "VITB12",
        "schemaOrgTag" => nil,
        "total" => 6.6337883819580075,
        "hasRDI" => true,
        "daily" => 110.56313969930012,
        "unit" => "µg"
      }, {
        "label" => "Vitamin D",
        "tag" => "VITD",
        "schemaOrgTag" => nil,
        "total" => 2.4380590057373044,
        "hasRDI" => true,
        "daily" => 0.6095147514343261,
        "unit" => "µg"
      }, {
        "label" => "Vitamin E",
        "tag" => "TOCPHA",
        "schemaOrgTag" => nil,
        "total" => 2.2697804053466797,
        "hasRDI" => true,
        "daily" => 11.348902026733398,
        "unit" => "mg"
      }, {
        "label" => "Vitamin K",
        "tag" => "VITK1",
        "schemaOrgTag" => nil,
        "total" => 18.308678436279298,
        "hasRDI" => true,
        "daily" => 22.88584804534912,
        "unit" => "µg"
      } ]
    }}

  it "can create a Recipe with a complete recipe hash returned from the api" do
    recipe = Recipe.new(recipe_hash)
    recipe.class.must_equal Recipe
    recipe.label.must_equal "Ham, Cheese, and Pickle Skewers"
    recipe.uri.must_equal "http://www.edamam.com/ontologies/edamam.owl#recipe_c748acc6945e3ed9b8e46d6f6489f781"
    recipe.image.must_equal "https://www.edamam.com/web-img/5bc/5bc9890a55411da589e654974243ed00.jpg"
    recipe.url.must_equal "http://www.marthastewart.com/354962/ham-cheese-and-pickle-skewers"
    recipe.ingredient_lines.must_equal recipe_hash["ingredientLines"]
    recipe.ingredients.must_equal recipe_hash["ingredients"]
    recipe.total_nutrients.must_equal recipe_hash["totalNutrients"]
    recipe.total_daily.must_equal recipe_hash["totalDaily"]
  end

  it "has a accessor methods" do
    recipe = Recipe.new(recipe_hash)
    recipe.must_respond_to :label
    recipe.must_respond_to :uri
    recipe.must_respond_to :image
    recipe.must_respond_to :url
    recipe.must_respond_to :ingredient_lines
    recipe.must_respond_to :ingredients
    recipe.must_respond_to :total_nutrients
    recipe.must_respond_to :total_daily
  end
end
