# askMeChat

## Preview 

https://github.com/miucciaknows/askMeChat/assets/81270839/5afb677e-c7e7-4383-8e97-922fe26f9153

This project was developed using **Swift** and **Objective-C**, utilizing **UIKit.**

I use **Watson Discovery** as my _knowledge base_ and **NeuralSeek** API to seek the answers

## Watson Discovery

**Watson Discovery** is an **IBM** service that facilitates the extraction of valuable insights and information from a variety of data sources. It uses natural language processing and machine learning to understand and interpret unstructured text, allowing users to search, analyze, and visualize data in a meaningful way.

Overall, **Watson Discovery's** combination of **NLP** and **Machine Learning** enables it to understand the context, meaning, and relationships within the text, allowing for more accurate and relevant document retrieval and analysis.

## Neural Seek

**NeuralSeek** is a cutting-edge AI tool that harnesses neural networks for advanced search capabilities. It employs deep learning techniques to enhance search accuracy, context understanding and relevance. 

#### The combination of Watson Discovery and NeuralSeek results in a search system that marries deep learning-based contextual comprehension with advanced semantic similarity analysis, that delivers highly accurate, nuanced, and relevant information, even when dealing with complex queries and diverse data sources.

##  To replicate this project, you'll need:

**1.** An instance of **Watson Discovery** on **IBM Cloud.**
<br>

**2.** An instance of **NeuralSeek** on **IBM Cloud.**
<br>

**3.** **Xcode** installed on your **macOS.**

Here's how you can proceed:

**1.** Set up your document collection in **Watson Discovery** using **Document Retrieval.**
<br>

**2.** In your **NeuralSeek** instance,  a connect **Watson Discovery** to **NeuralSeek** as your knowledge base.
<br>

**3.** Retrieve the **URL** and **API key** from **NeuralSeek**, then place them in the **ViewController.swift** file.
<br>



https://github.com/miucciaknows/askMeChat/assets/81270839/5b2ba55e-fede-4763-a205-d332a410971c


`You can incorporate your API key using a schema by passing the name "apikey" along with its value. Alternatively, you can directly insert your API key value into the appropriate field within the code.`

<img width="1420" alt="" src="https://github.com/miucciaknows/askMeChat/assets/81270839/a81a7486-2daa-4762-a208-2ab14bb4a0c1">

By following these steps, you'll be able to replicate the project successfully and integrate **Watson Discovery** and **NeuralSeek** into your Xcode project.
