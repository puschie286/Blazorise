---
title: "Autocomplete extension"
permalink: /docs/extensions/autocomplete/
excerpt: "Learn how to use autocomplete components."
toc: true
toc_label: "Guide"
---

## Basics

The `Autocomplete` component provides suggestions while you type into the field. The component is in essence a text box which, at runtime, filters data in a drop-down by a `Filter` operator when a user captures a value.
You may also enable `FreeTyping` and `AutoComplete` can be used to just provide suggestions based on user input.

## Installation

The Autocomplete extension is part of the **Blazorise.Components** NuGet package.
{: .notice--info}

### NuGet

Install extension from NuGet.

```
Install-Package Blazorise.Components
```

## Usage

### Markup

```html
<Autocomplete TItem="MySelectModel"
                TValue="string"
                Data="@myDdlData"
                TextField="@(( item ) => item.MyTextField)"
                ValueField="@(( item ) => item.MyTextField)"
                SelectedValue="@selectedSearchValue"
                SelectedValueChanged="@MySearchHandler"
                @bind-SelectedText="selectedAutoCompleteText"
                Placeholder="Search..."
                Filter="AutocompleteFilter.StartsWith"
                FreeTyping="true"
                CustomFilter="@(( item, searchValue ) => item.MyTextField.IndexOf( searchValue, 0, StringComparison.CurrentCultureIgnoreCase ) >= 0 )">
    <NotFoundContent> Sorry... @context was not found! :( </NotFoundContent>
</Autocomplete>
```

### Data binding

```cs
@code{
    public class MySelectModel
    {
        public int MyValueField { get; set; }
        public string MyTextField { get; set; }
    }

    static string[] Countries = { "Albania", "Andorra", "Armenia", "Austria", "Azerbaijan", "Belarus", "Belgium", "Bosnia & Herzegovina", "Bulgaria", "Croatia", "Cyprus", "Czech Republic", "Denmark", "Estonia", "Finland", "France", "Georgia", "Germany", "Greece", "Hungary", "Iceland", "Ireland", "Italy", "Kosovo", "Latvia", "Liechtenstein", "Lithuania", "Luxembourg", "Macedonia", "Malta", "Moldova", "Monaco", "Montenegro", "Netherlands", "Norway", "Poland", "Portugal", "Romania", "Russia", "San Marino", "Serbia", "Slovakia", "Slovenia", "Spain", "Sweden", "Switzerland", "Turkey", "Ukraine", "United Kingdom", "Vatican City" };
    IEnumerable<MySelectModel> myDdlData = Enumerable.Range( 1, Countries.Length ).Select( x => new MySelectModel { MyTextField = Countries[x - 1], MyValueField = x } );

    string selectedSearchValue { get; set; }
    string selectedAutoCompleteText { get; set; }

    void MySearchHandler( string newValue )
    {
        selectedSearchValue = newValue;
    }
}
```

## Attributes

| Name                          | Type                          | Default       | Description                                                                                           |
|-------------------------------|-------------------------------|---------------|-------------------------------------------------------------------------------------------------------|
| TItem                         | generic                       |               | Model data type.                                                                                      |
| Data                          | IEnumerable<TItem>            |               | Data used for the search.                                                                             |
| TextField                     | Func                          |               | Selector for the display name field.                                                                  |
| ValueField                    | Func                          |               | Selector for the value field.                                                                         |
| SelectedValue                 | object                        |               | Currently selected value.                                                                             |
| SelectedValueChanged          | event                         |               | Raises an event after the selected value has changed.                                                 |
| SelectedText                  | string                        |               | Currently selected text.                                                                              |
| SelectedTextChanged           | event                         |               | Raises an event after the selected text has changed.                                                  |
| SearchChanged                 | event                         |               | Occurs on every search text change.                                                                   |
| Placeholder                   | string                        |               | Placeholder for the empty search field.                                                               |
| MinLength                     | int                           | 1             | Minimum number of character needed to start search.                                                   |
| MaxMenuHeight                 | string                        | `200px`       | Sets the maximum height of the dropdown menu.                                                         |
| Filter                        | enum                          | StartsWith    | Filter method used to search the data.                                                                |
| Disabled                      | boolean                       | false         | Disable the input field.                                                                              |
| ChangeTextOnKeyPress          | `bool?`                       |  null         | If true the text in will be changed after each key press (overrides global settings).                 |
| DelayTextOnKeyPress           | `bool?`                       |  null         | If true the entered text will be slightly delayed before submitting it to the internal value.         |
| DelayTextOnKeyPressInterval   | `int?`                        |  null         | Interval in milliseconds that entered text will be delayed from submitting to the internal value.     |
| Validator                     | `Action<ValidatorEventArgs>`  | null          | Validation handler used to validate selected value.                                                   |
| NotFoundContent               | `RenderFragment<string>`      |               | Render fragment when no value has been found on the data source.                                      |
| NotFound                      | `EventCallback<string>`       |               | Raises an event when no value has been found on the data source.                                      |
| FreeTyping                    | `bool`                        | false         | Allows the value to not be on the data source.                                                        |
| CustomFilter                  | `Func<TItem, string, bool>`   |               | Handler for custom filtering on Autocomplete's data source.                                           |
