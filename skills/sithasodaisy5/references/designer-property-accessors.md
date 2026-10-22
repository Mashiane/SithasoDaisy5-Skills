---
name: designer-property-accessors
description: Source audit mapping every SithasoDaisy5 designer property to its named setter and getter, including absent accessors and intentional aliases.
---

# Designer Property Accessor Audit

Audited 134 framework components and 3636 `#DesignerProperty` declarations in the framework source on 2026-10-22.

The component pages now include Setter and Getter columns beside every designer property. These columns name the actual source methods. A dash means no corresponding named accessor exists in that component; a property may still be consumed during `DesignerCreateView`.

Coverage: 3552 properties have a named setter; 3540 have a named getter; 3537 have both. Of the remaining 99, 81 have neither, 15 have only a setter, and 3 have only a getter. 434 properties use a documented accessor name that differs from the designer key.

Updated 30 stale Props counts across the skill index and component manifest to match the source declarations.

## Accessor gaps and aliases

For each listed component, the skill page has the complete property table. This section calls out every key without both accessors and every intentional key-to-method name difference.

### SDUI5Accordion

Source: `SDUI5Accordion.bas` · Skill: [`components/SDUI5Accordion.md`](components/SDUI5Accordion.md)

Accessor names that differ from their designer keys: `RawOptions` → `setOptions` / `getOptions` (Raw prefix alias); `RawClasses` → `setClasses` / `getClasses` (Raw prefix alias); `RawStyles` → `setStyles` / `getStyles` (Raw prefix alias); `RawAttributes` → `setAttributes` / `getAttributes` (Raw prefix alias).

### SDUI5AdvancedCheckGroup

Source: `SDUI5AdvancedCheckGroup.bas` · Skill: [`components/SDUI5AdvancedCheckGroup.md`](components/SDUI5AdvancedCheckGroup.md)

Accessor names that differ from their designer keys: `RawOptions` → `setOptions` / `getRawOptions` (Raw prefix alias); `RawClasses` → `setClasses` / `getClasses` (Raw prefix alias); `RawStyles` → `setStyles` / `getStyles` (Raw prefix alias); `RawAttributes` → `setAttributes` / `getAttributes` (Raw prefix alias).

### SDUI5Alert

Source: `SDUI5Alert.bas` · Skill: [`components/SDUI5Alert.md`](components/SDUI5Alert.md)

Accessor names that differ from their designer keys: `RawClasses` → `setClasses` / `getClasses` (Raw prefix alias); `RawStyles` → `setStyles` / `getStyles` (Raw prefix alias); `RawAttributes` → `setAttributes` / `getAttributes` (Raw prefix alias).

Properties without a complete named setter/getter pair: `ReadMe` (setter: `—`; getter: `—`).

### SDUI5Aura

Source: `SDUI5Aura.bas` · Skill: [`components/SDUI5Aura.md`](components/SDUI5Aura.md)

Accessor names that differ from their designer keys: `RawClasses` → `setClasses` / `getClasses` (Raw prefix alias); `RawStyles` → `setStyles` / `getStyles` (Raw prefix alias); `RawAttributes` → `setAttributes` / `getAttributes` (Raw prefix alias).

### SDUI5Avatar

Source: `SDUI5Avatar.bas` · Skill: [`components/SDUI5Avatar.md`](components/SDUI5Avatar.md)

Accessor names that differ from their designer keys: `RawClasses` → `setClasses` / `getClasses` (Raw prefix alias); `RawStyles` → `setStyles` / `getStyles` (Raw prefix alias); `RawAttributes` → `setAttributes` / `getAttributes` (Raw prefix alias).

### SDUI5AvatarGroup

Source: `SDUI5AvatarGroup.bas` · Skill: [`components/SDUI5AvatarGroup.md`](components/SDUI5AvatarGroup.md)

Accessor names that differ from their designer keys: `RawImages` → `setImages` / `getImages` (Raw prefix alias); `RawClasses` → `setClasses` / `getClasses` (Raw prefix alias); `RawStyles` → `setStyles` / `getStyles` (Raw prefix alias); `RawAttributes` → `setAttributes` / `getAttributes` (Raw prefix alias).

### SDUI5Badge

Source: `SDUI5Badge.bas` · Skill: [`components/SDUI5Badge.md`](components/SDUI5Badge.md)

Accessor names that differ from their designer keys: `RawClasses` → `setClasses` / `getClasses` (Raw prefix alias); `RawStyles` → `setStyles` / `getStyles` (Raw prefix alias); `RawAttributes` → `setAttributes` / `getAttributes` (Raw prefix alias).

### SDUI5BankCard

Source: `SDUI5BankCard.bas` · Skill: [`components/SDUI5BankCard.md`](components/SDUI5BankCard.md)

Accessor names that differ from their designer keys: `RawClasses` → `setClasses` / `getClasses` (Raw prefix alias); `RawStyles` → `setStyles` / `getStyles` (Raw prefix alias); `RawAttributes` → `setAttributes` / `getAttributes` (Raw prefix alias).

Properties without a complete named setter/getter pair: `GradientActive` (setter: `—`; getter: `—`); `Gradient` (setter: `—`; getter: `—`); `GradientColor1` (setter: `—`; getter: `—`); `GradientColor2` (setter: `—`; getter: `—`).

### SDUI5BarCode

Source: `SDUI5BarCode.bas` · Skill: [`components/SDUI5BarCode.md`](components/SDUI5BarCode.md)

Accessor names that differ from their designer keys: `RawClasses` → `setClasses` / `getClasses` (Raw prefix alias); `RawStyles` → `setStyles` / `getStyles` (Raw prefix alias); `RawAttributes` → `setAttributes` / `getAttributes` (Raw prefix alias).

### SDUI5BarcodeReader

Source: `SDUI5BarcodeReader.bas` · Skill: [`components/SDUI5BarcodeReader.md`](components/SDUI5BarcodeReader.md)

Accessor names that differ from their designer keys: `RawClasses` → `setClasses` / `getClasses` (Raw prefix alias); `RawStyles` → `setStyles` / `getStyles` (Raw prefix alias); `RawAttributes` → `setAttributes` / `getAttributes` (Raw prefix alias).

### SDUI5BasicLabel

Source: `SDUI5BasicLabel.bas` · Skill: [`components/SDUI5BasicLabel.md`](components/SDUI5BasicLabel.md)

Accessor names that differ from their designer keys: `RawClasses` → `setClasses` / `getClasses` (Raw prefix alias); `RawStyles` → `setStyles` / `getStyles` (Raw prefix alias); `RawAttributes` → `setAttributes` / `getAttributes` (Raw prefix alias).

Properties without a complete named setter/getter pair: `FontAwesomeIcon` (setter: `—`; getter: `—`); `MaterialIcon` (setter: `—`; getter: `—`); `GradientActive` (setter: `—`; getter: `—`); `Gradient` (setter: `—`; getter: `—`); `GradientColor1` (setter: `—`; getter: `—`); `GradientColor2` (setter: `—`; getter: `—`).

### SDUI5BottomNavigation

Source: `SDUI5BottomNavigation.bas` · Skill: [`components/SDUI5BottomNavigation.md`](components/SDUI5BottomNavigation.md)

Accessor names that differ from their designer keys: `RawClasses` → `setClasses` / `getClasses` (Raw prefix alias); `RawStyles` → `setStyles` / `getStyles` (Raw prefix alias); `RawAttributes` → `setAttributes` / `getAttributes` (Raw prefix alias).

### SDUI5BreadCrumbs

Source: `SDUI5BreadCrumbs.bas` · Skill: [`components/SDUI5BreadCrumbs.md`](components/SDUI5BreadCrumbs.md)

Accessor names that differ from their designer keys: `RawOptions` → `setOptions` / `getOptions` (Raw prefix alias); `RawClasses` → `setClasses` / `getClasses` (Raw prefix alias); `RawStyles` → `setStyles` / `getStyles` (Raw prefix alias); `RawAttributes` → `setAttributes` / `getAttributes` (Raw prefix alias).

Properties without a complete named setter/getter pair: `ReadMe` (setter: `—`; getter: `—`).

### SDUI5Browser

Source: `SDUI5Browser.bas` · Skill: [`components/SDUI5Browser.md`](components/SDUI5Browser.md)

Accessor names that differ from their designer keys: `RawClasses` → `setClasses` / `getClasses` (Raw prefix alias); `RawStyles` → `setStyles` / `getStyles` (Raw prefix alias); `RawAttributes` → `setAttributes` / `getAttributes` (Raw prefix alias).

### SDUI5Button

Source: `SDUI5Button.bas` · Skill: [`components/SDUI5Button.md`](components/SDUI5Button.md)

Accessor names that differ from their designer keys: `RawClasses` → `setClasses` / `getClasses` (Raw prefix alias); `RawStyles` → `setStyles` / `getStyles` (Raw prefix alias); `RawAttributes` → `setAttributes` / `getAttributes` (Raw prefix alias).

### SDUI5Calendar

Source: `SDUI5Calendar.bas` · Skill: [`components/_unused/SDUI5Calendar.md`](components/_unused/SDUI5Calendar.md)

Properties without a complete named setter/getter pair: `Rounded` (setter: `—`; getter: `—`); `Shadow` (setter: `—`; getter: `—`); `PositionStyle` (setter: `—`; getter: `—`); `Position` (setter: `—`; getter: `—`); `MarginAXYTBLR` (setter: `—`; getter: `—`); `PaddingAXYTBLR` (setter: `—`; getter: `—`); `RawClasses` (setter: `—`; getter: `—`); `RawStyles` (setter: `—`; getter: `—`); `RawAttributes` (setter: `—`; getter: `—`).

### SDUI5Card

Source: `SDUI5Card.bas` · Skill: [`components/SDUI5Card.md`](components/SDUI5Card.md)

Accessor names that differ from their designer keys: `RawContent` → `setContent` / `getContent` (Raw prefix alias); `RawClasses` → `setClasses` / `getClasses` (Raw prefix alias); `RawStyles` → `setStyles` / `getStyles` (Raw prefix alias); `RawAttributes` → `setAttributes` / `getAttributes` (Raw prefix alias).

Properties without a complete named setter/getter pair: `ReadMe` (setter: `—`; getter: `—`); `HoverGallery` (setter: `setHoverGallery`; getter: `—`).

### SDUI5Carousel

Source: `SDUI5Carousel.bas` · Skill: [`components/SDUI5Carousel.md`](components/SDUI5Carousel.md)

Accessor names that differ from their designer keys: `RawClasses` → `setClasses` / `getClasses` (Raw prefix alias); `RawStyles` → `setStyles` / `getStyles` (Raw prefix alias); `RawAttributes` → `setAttributes` / `getAttributes` (Raw prefix alias).

### SDUI5CarouselItem

Source: `SDUI5CarouselItem.bas` · Skill: [`components/SDUI5CarouselItem.md`](components/SDUI5CarouselItem.md)

Accessor names that differ from their designer keys: `RawClasses` → `setClasses` / `getClasses` (Raw prefix alias); `RawStyles` → `setStyles` / `getStyles` (Raw prefix alias); `RawAttributes` → `setAttributes` / `getAttributes` (Raw prefix alias).

### SDUI5ChatBubble

Source: `SDUI5ChatBubble.bas` · Skill: [`components/SDUI5ChatBubble.md`](components/SDUI5ChatBubble.md)

Accessor names that differ from their designer keys: `RawClasses` → `setClasses` / `getClasses` (Raw prefix alias); `RawStyles` → `setStyles` / `getStyles` (Raw prefix alias); `RawAttributes` → `setAttributes` / `getAttributes` (Raw prefix alias).

### SDUI5ChatItem

Source: `SDUI5ChatItem.bas` · Skill: [`components/SDUI5ChatItem.md`](components/SDUI5ChatItem.md)

Accessor names that differ from their designer keys: `RawClasses` → `setClasses` / `getClasses` (Raw prefix alias); `RawStyles` → `setStyles` / `getStyles` (Raw prefix alias); `RawAttributes` → `setAttributes` / `getAttributes` (Raw prefix alias).

### SDUI5CheckBox

Source: `SDUI5CheckBox.bas` · Skill: [`components/SDUI5CheckBox.md`](components/SDUI5CheckBox.md)

Accessor names that differ from their designer keys: `RawClasses` → `setClasses` / `getClasses` (Raw prefix alias); `RawStyles` → `setStyles` / `getStyles` (Raw prefix alias); `RawAttributes` → `setAttributes` / `getAttributes` (Raw prefix alias).

### SDUI5CheckBoxGroup

Source: `SDUI5CheckBoxGroup.bas` · Skill: [`components/SDUI5CheckBoxGroup.md`](components/SDUI5CheckBoxGroup.md)

Accessor names that differ from their designer keys: `RawOptions` → `setOptions` / `getOptions` (Raw prefix alias); `RawClasses` → `setClasses` / `getClasses` (Raw prefix alias); `RawStyles` → `setStyles` / `getStyles` (Raw prefix alias); `RawAttributes` → `setAttributes` / `getAttributes` (Raw prefix alias).

Properties without a complete named setter/getter pair: `Size` (setter: `setSize`; getter: `—`).

### SDUI5Code

Source: `SDUI5Code.bas` · Skill: [`components/SDUI5Code.md`](components/SDUI5Code.md)

Accessor names that differ from their designer keys: `RawContent` → `setContent` / `getContent` (Raw prefix alias); `RawClasses` → `setClasses` / `getClasses` (Raw prefix alias); `RawStyles` → `setStyles` / `getStyles` (Raw prefix alias); `RawAttributes` → `setAttributes` / `getAttributes` (Raw prefix alias).

Properties without a complete named setter/getter pair: `ReadMe` (setter: `—`; getter: `—`).

### SDUI5Collapse

Source: `SDUI5Collapse.bas` · Skill: [`components/SDUI5Collapse.md`](components/SDUI5Collapse.md)

Accessor names that differ from their designer keys: `RawContent` → `setContent` / `getContent` (Raw prefix alias); `RawClasses` → `setClasses` / `getClasses` (Raw prefix alias); `RawStyles` → `setStyles` / `getStyles` (Raw prefix alias); `RawAttributes` → `setAttributes` / `getAttributes` (Raw prefix alias).

Properties without a complete named setter/getter pair: `ReadMe` (setter: `—`; getter: `—`); `Border` (setter: `—`; getter: `—`).

### SDUI5Column

Source: `SDUI5Column.bas` · Skill: [`components/SDUI5Column.md`](components/SDUI5Column.md)

Accessor names that differ from their designer keys: `RawBorderColor` → `setBorderColor` / `getBorderColor` (Raw prefix alias); `RawBorderStyle` → `setBorderStyle` / `getBorderStyle` (Raw prefix alias); `RawBorderWidth` → `setBorderWidth` / `getBorderWidth` (Raw prefix alias); `RawBorderRadius` → `setBorderRadius` / `getBorderRadius` (Raw prefix alias); `RawClasses` → `setClasses` / `getClasses` (Raw prefix alias); `RawStyles` → `setStyles` / `getStyles` (Raw prefix alias); `RawAttributes` → `setAttributes` / `getAttributes` (Raw prefix alias).

### SDUI5Component

Source: `SDUI5Component.bas` · Skill: [`components/SDUI5Component.md`](components/SDUI5Component.md)

Accessor names that differ from their designer keys: `RawClasses` → `setClasses` / `getClasses` (Raw prefix alias); `RawStyles` → `setStyles` / `getStyles` (Raw prefix alias); `RawAttributes` → `setAttributes` / `getAttributes` (Raw prefix alias).

Properties without a complete named setter/getter pair: `Text` (setter: `—`; getter: `—`).

### SDUI5Container

Source: `SDUI5Container.bas` · Skill: [`components/SDUI5Container.md`](components/SDUI5Container.md)

Accessor names that differ from their designer keys: `RawBorderColor` → `setBorderColor` / `getBorderColor` (Raw prefix alias); `RawBorderStyle` → `setBorderStyle` / `getBorderStyle` (Raw prefix alias); `RawBorderWidth` → `setBorderWidth` / `getBorderWidth` (Raw prefix alias); `RawBorderRadius` → `setBorderRadius` / `getBorderRadius` (Raw prefix alias); `RawClasses` → `setClasses` / `getClasses` (Raw prefix alias); `RawStyles` → `setStyles` / `getStyles` (Raw prefix alias); `RawAttributes` → `setAttributes` / `getAttributes` (Raw prefix alias).

Properties without a complete named setter/getter pair: `GradientActive` (setter: `—`; getter: `—`); `Gradient` (setter: `—`; getter: `—`); `GradientColor1` (setter: `—`; getter: `—`); `GradientColor2` (setter: `—`; getter: `—`).

### SDUI5ContextMenu

Source: `SDUI5ContextMenu.bas` · Skill: [`components/SDUI5ContextMenu.md`](components/SDUI5ContextMenu.md)

Accessor names that differ from their designer keys: `RawClasses` → `setClasses` / `getClasses` (Raw prefix alias); `RawStyles` → `setStyles` / `getStyles` (Raw prefix alias); `RawAttributes` → `setAttributes` / `getAttributes` (Raw prefix alias).

### SDUI5CountDown

Source: `SDUI5CountDown.bas` · Skill: [`components/SDUI5CountDown.md`](components/SDUI5CountDown.md)

Accessor names that differ from their designer keys: `RawClasses` → `setClasses` / `getClasses` (Raw prefix alias); `RawStyles` → `setStyles` / `getStyles` (Raw prefix alias); `RawAttributes` → `setAttributes` / `getAttributes` (Raw prefix alias).

### SDUI5DatePickerTimeLine

Source: `SDUI5DatePickerTimeLine.bas` · Skill: [`components/SDUI5DatePickerTimeLine.md`](components/SDUI5DatePickerTimeLine.md)

Accessor names that differ from their designer keys: `RawClasses` → `setClasses` / `getClasses` (Raw prefix alias); `RawStyles` → `setStyles` / `getStyles` (Raw prefix alias); `RawAttributes` → `setAttributes` / `getAttributes` (Raw prefix alias).

### SDUI5Device

Source: `SDUI5Device.bas` · Skill: [`components/SDUI5Device.md`](components/SDUI5Device.md)

Accessor names that differ from their designer keys: `RawClasses` → `setClasses` / `getClasses` (Raw prefix alias); `RawStyles` → `setStyles` / `getStyles` (Raw prefix alias); `RawAttributes` → `setAttributes` / `getAttributes` (Raw prefix alias).

### SDUI5Diff

Source: `SDUI5Diff.bas` · Skill: [`components/SDUI5Diff.md`](components/SDUI5Diff.md)

Accessor names that differ from their designer keys: `RawClasses` → `setClasses` / `getClasses` (Raw prefix alias); `RawStyles` → `setStyles` / `getStyles` (Raw prefix alias); `RawAttributes` → `setAttributes` / `getAttributes` (Raw prefix alias).

Properties without a complete named setter/getter pair: `Rounded` (setter: `—`; getter: `—`); `RoundedBox` (setter: `—`; getter: `—`); `Shadow` (setter: `—`; getter: `—`).

### SDUI5Divider

Source: `SDUI5Divider.bas` · Skill: [`components/SDUI5Divider.md`](components/SDUI5Divider.md)

Accessor names that differ from their designer keys: `RawClasses` → `setClasses` / `getClasses` (Raw prefix alias); `RawStyles` → `setStyles` / `getStyles` (Raw prefix alias); `RawAttributes` → `setAttributes` / `getAttributes` (Raw prefix alias).

### SDUI5Dock

Source: `SDUI5Dock.bas` · Skill: [`components/SDUI5Dock.md`](components/SDUI5Dock.md)

Accessor names that differ from their designer keys: `RawClasses` → `setClasses` / `getClasses` (Raw prefix alias); `RawStyles` → `setStyles` / `getStyles` (Raw prefix alias); `RawAttributes` → `setAttributes` / `getAttributes` (Raw prefix alias).

### SDUI5Drawer

Source: `SDUI5Drawer.bas` · Skill: [`components/SDUI5Drawer.md`](components/SDUI5Drawer.md)

Accessor names that differ from their designer keys: `RawClasses` → `setClasses` / `getClasses` (Raw prefix alias); `RawStyles` → `setStyles` / `getStyles` (Raw prefix alias); `RawAttributes` → `setAttributes` / `getAttributes` (Raw prefix alias).

Properties without a complete named setter/getter pair: `ReadMe` (setter: `—`; getter: `—`).

### SDUI5DrawerUser

Source: `SDUI5DrawerUser.bas` · Skill: [`components/SDUI5DrawerUser.md`](components/SDUI5DrawerUser.md)

Accessor names that differ from their designer keys: `RawClasses` → `setClasses` / `getClasses` (Raw prefix alias); `RawStyles` → `setStyles` / `getStyles` (Raw prefix alias); `RawAttributes` → `setAttributes` / `getAttributes` (Raw prefix alias).

### SDUI5DropDown

Source: `SDUI5DropDown.bas` · Skill: [`components/SDUI5DropDown.md`](components/SDUI5DropDown.md)

Accessor names that differ from their designer keys: `RawClasses` → `setClasses` / `getClasses` (Raw prefix alias); `RawStyles` → `setStyles` / `getStyles` (Raw prefix alias); `RawAttributes` → `setAttributes` / `getAttributes` (Raw prefix alias).

### SDUI5DropZone

Source: `SDUI5DropZone.bas` · Skill: [`components/SDUI5DropZone.md`](components/SDUI5DropZone.md)

Accessor names that differ from their designer keys: `RawClasses` → `setClasses` / `getClasses` (Raw prefix alias); `RawStyles` → `setStyles` / `getStyles` (Raw prefix alias); `RawAttributes` → `setAttributes` / `getAttributes` (Raw prefix alias).

### SDUI5EasyMDE

Source: `SDUI5EasyMDE.bas` · Skill: [`components/SDUI5EasyMDE.md`](components/SDUI5EasyMDE.md)

Accessor names that differ from their designer keys: `RawClasses` → `setClasses` / `getClasses` (Raw prefix alias); `RawStyles` → `setStyles` / `getStyles` (Raw prefix alias); `RawAttributes` → `setAttributes` / `getAttributes` (Raw prefix alias).

### SDUI5Fab

Source: `SDUI5Fab.bas` · Skill: [`components/SDUI5Fab.md`](components/SDUI5Fab.md)

Accessor names that differ from their designer keys: `RawClasses` → `setClasses` / `getClasses` (Raw prefix alias); `RawStyles` → `setStyles` / `getStyles` (Raw prefix alias); `RawAttributes` → `setAttributes` / `getAttributes` (Raw prefix alias).

### SDUI5FAIconPicker

Source: `SDUI5FAIconPicker.bas` · Skill: [`components/SDUI5FAIconPicker.md`](components/SDUI5FAIconPicker.md)

Accessor names that differ from their designer keys: `RawClasses` → `setClasses` / `getClasses` (Raw prefix alias); `RawStyles` → `setStyles` / `getStyles` (Raw prefix alias); `RawAttributes` → `setAttributes` / `getAttributes` (Raw prefix alias).

Properties without a complete named setter/getter pair: `BackgroundColor` (setter: `—`; getter: `—`).

### SDUI5FieldSet

Source: `SDUI5FieldSet.bas` · Skill: [`components/SDUI5FieldSet.md`](components/SDUI5FieldSet.md)

Accessor names that differ from their designer keys: `RawClasses` → `setClasses` / `getClasses` (Raw prefix alias); `RawStyles` → `setStyles` / `getStyles` (Raw prefix alias); `RawAttributes` → `setAttributes` / `getAttributes` (Raw prefix alias).

Properties without a complete named setter/getter pair: `ReadMe` (setter: `—`; getter: `—`).

### SDUI5FileInput

Source: `SDUI5FileInput.bas` · Skill: [`components/SDUI5FileInput.md`](components/SDUI5FileInput.md)

Accessor names that differ from their designer keys: `RawClasses` → `setClasses` / `getClasses` (Raw prefix alias); `RawStyles` → `setStyles` / `getStyles` (Raw prefix alias); `RawAttributes` → `setAttributes` / `getAttributes` (Raw prefix alias).

### SDUI5Filter

Source: `SDUI5Filter.bas` · Skill: [`components/SDUI5Filter.md`](components/SDUI5Filter.md)

Accessor names that differ from their designer keys: `RawOptions` → `setOptions` / `getOptions` (Raw prefix alias); `RawClasses` → `setClasses` / `getClasses` (Raw prefix alias); `RawStyles` → `setStyles` / `getStyles` (Raw prefix alias); `RawAttributes` → `setAttributes` / `getAttributes` (Raw prefix alias).

### SDUI5Footer

Source: `SDUI5Footer.bas` · Skill: [`components/SDUI5Footer.md`](components/SDUI5Footer.md)

Accessor names that differ from their designer keys: `RawClasses` → `setClasses` / `getClasses` (Raw prefix alias); `RawStyles` → `setStyles` / `getStyles` (Raw prefix alias); `RawAttributes` → `setAttributes` / `getAttributes` (Raw prefix alias).

### SDUI5FooterTitle

Source: `SDUI5FooterTitle.bas` · Skill: [`components/SDUI5FooterTitle.md`](components/SDUI5FooterTitle.md)

Accessor names that differ from their designer keys: `RawClasses` → `setClasses` / `getClasses` (Raw prefix alias); `RawStyles` → `setStyles` / `getStyles` (Raw prefix alias); `RawAttributes` → `setAttributes` / `getAttributes` (Raw prefix alias).

### SDUI5Form

Source: `SDUI5Form.bas` · Skill: [`components/SDUI5Form.md`](components/SDUI5Form.md)

Accessor names that differ from their designer keys: `RawClasses` → `setClasses` / `getClasses` (Raw prefix alias); `RawStyles` → `setStyles` / `getStyles` (Raw prefix alias); `RawAttributes` → `setAttributes` / `getAttributes` (Raw prefix alias).

### SDUI5FullCalendar

Source: `SDUI5FullCalendar.bas` · Skill: [`components/SDUI5FullCalendar.md`](components/SDUI5FullCalendar.md)

Accessor names that differ from their designer keys: `RawClasses` → `setClasses` / `getClasses` (Raw prefix alias); `RawStyles` → `setStyles` / `getStyles` (Raw prefix alias); `RawAttributes` → `setAttributes` / `getAttributes` (Raw prefix alias).

### SDUI5GenderChart

Source: `SDUI5GenderChart.bas` · Skill: [`components/SDUI5GenderChart.md`](components/SDUI5GenderChart.md)

Accessor names that differ from their designer keys: `RawClasses` → `setClasses` / `getClasses` (Raw prefix alias); `RawStyles` → `setStyles` / `getStyles` (Raw prefix alias); `RawAttributes` → `setAttributes` / `getAttributes` (Raw prefix alias).

### SDUI5GoogleAdSense

Source: `SDUI5GoogleAdSense.bas` · Skill: [`components/SDUI5GoogleAdSense.md`](components/SDUI5GoogleAdSense.md)

Accessor names that differ from their designer keys: `RawClasses` → `setClasses` / `getClasses` (Raw prefix alias); `RawStyles` → `setStyles` / `getStyles` (Raw prefix alias); `RawAttributes` → `setAttributes` / `getAttributes` (Raw prefix alias).

### SDUI5GroupSelect

Source: `SDUI5GroupSelect.bas` · Skill: [`components/SDUI5GroupSelect.md`](components/SDUI5GroupSelect.md)

Accessor names that differ from their designer keys: `RawOptions` → `setOptions` / `getOptions` (Raw prefix alias); `RawClasses` → `setClasses` / `getClasses` (Raw prefix alias); `RawStyles` → `setStyles` / `getStyles` (Raw prefix alias); `RawAttributes` → `setAttributes` / `getAttributes` (Raw prefix alias).

### SDUI5Hero

Source: `SDUI5Hero.bas` · Skill: [`components/SDUI5Hero.md`](components/SDUI5Hero.md)

Accessor names that differ from their designer keys: `RawContentAttributes` → `setContentAttributes` / `getContentAttributes` (Raw prefix alias); `RawContentClass` → `setContentClass` / `getContentClass` (Raw prefix alias); `RawContentStyle` → `setContentStyle` / `getContentStyle` (Raw prefix alias); `RawClasses` → `setClasses` / `getClasses` (Raw prefix alias); `RawStyles` → `setStyles` / `getStyles` (Raw prefix alias); `RawAttributes` → `setAttributes` / `getAttributes` (Raw prefix alias).

Properties without a complete named setter/getter pair: `ReadMe` (setter: `—`; getter: `—`).

### SDUI5Hover3D

Source: `SDUI5Hover3D.bas` · Skill: [`components/SDUI5Hover3D.md`](components/SDUI5Hover3D.md)

Accessor names that differ from their designer keys: `RawClasses` → `setClasses` / `getClasses` (Raw prefix alias); `RawStyles` → `setStyles` / `getStyles` (Raw prefix alias); `RawAttributes` → `setAttributes` / `getAttributes` (Raw prefix alias).

### SDUI5HoverGallery

Source: `SDUI5HoverGallery.bas` · Skill: [`components/SDUI5HoverGallery.md`](components/SDUI5HoverGallery.md)

Accessor names that differ from their designer keys: `RawClasses` → `setClasses` / `getClasses` (Raw prefix alias); `RawStyles` → `setStyles` / `getStyles` (Raw prefix alias); `RawAttributes` → `setAttributes` / `getAttributes` (Raw prefix alias).

### SDUI5Image

Source: `SDUI5Image.bas` · Skill: [`components/SDUI5Image.md`](components/SDUI5Image.md)

Accessor names that differ from their designer keys: `RawClasses` → `setClasses` / `getClasses` (Raw prefix alias); `RawStyles` → `setStyles` / `getStyles` (Raw prefix alias); `RawAttributes` → `setAttributes` / `getAttributes` (Raw prefix alias).

### SDUI5Indicator

Source: `SDUI5Indicator.bas` · Skill: [`components/SDUI5Indicator.md`](components/SDUI5Indicator.md)

Properties without a complete named setter/getter pair: `Size` (setter: `—`; getter: `—`).

### SDUI5InfoCard

Source: `SDUI5InfoCard.bas` · Skill: [`components/SDUI5InfoCard.md`](components/SDUI5InfoCard.md)

Accessor names that differ from their designer keys: `RawClasses` → `setClasses` / `getClasses` (Raw prefix alias); `RawStyles` → `setStyles` / `getStyles` (Raw prefix alias); `RawAttributes` → `setAttributes` / `getAttributes` (Raw prefix alias).

### SDUI5JsonEditor

Source: `SDUI5JsonEditor.bas` · Skill: [`components/SDUI5JsonEditor.md`](components/SDUI5JsonEditor.md)

Accessor names that differ from their designer keys: `RawClasses` → `setClasses` / `getClasses` (Raw prefix alias); `RawStyles` → `setStyles` / `getStyles` (Raw prefix alias); `RawAttributes` → `setAttributes` / `getAttributes` (Raw prefix alias).

Properties without a complete named setter/getter pair: `ButtonSize` (setter: `—`; getter: `—`); `ButtonsOutlined` (setter: `—`; getter: `—`).

### SDUI5JsonTree

Source: `SDUI5JsonTree.bas` · Skill: [`components/SDUI5JsonTree.md`](components/SDUI5JsonTree.md)

Accessor names that differ from their designer keys: `RawClasses` → `setClasses` / `getClasses` (Raw prefix alias); `RawStyles` → `setStyles` / `getStyles` (Raw prefix alias); `RawAttributes` → `setAttributes` / `getAttributes` (Raw prefix alias).

### SDUI5KanBan

Source: `SDUI5KanBan.bas` · Skill: [`components/SDUI5KanBan.md`](components/SDUI5KanBan.md)

Accessor names that differ from their designer keys: `RawClasses` → `setClasses` / `getClasses` (Raw prefix alias); `RawStyles` → `setStyles` / `getStyles` (Raw prefix alias); `RawAttributes` → `setAttributes` / `getAttributes` (Raw prefix alias).

### SDUI5Kbd

Source: `SDUI5Kbd.bas` · Skill: [`components/SDUI5Kbd.md`](components/SDUI5Kbd.md)

Accessor names that differ from their designer keys: `RawClasses` → `setClasses` / `getClasses` (Raw prefix alias); `RawStyles` → `setStyles` / `getStyles` (Raw prefix alias); `RawAttributes` → `setAttributes` / `getAttributes` (Raw prefix alias).

### SDUI5Label

Source: `SDUI5Label.bas` · Skill: [`components/SDUI5Label.md`](components/SDUI5Label.md)

Accessor names that differ from their designer keys: `RawOptions` → `setOptions` / `getOptions` (Raw prefix alias); `RawClasses` → `setClasses` / `getClasses` (Raw prefix alias); `RawStyles` → `setStyles` / `getStyles` (Raw prefix alias); `RawAttributes` → `setAttributes` / `getAttributes` (Raw prefix alias).

Properties without a complete named setter/getter pair: `Value` (setter: `—`; getter: `—`).

### SDUI5Leaflet

Source: `SDUI5Leaflet.bas` · Skill: [`components/SDUI5Leaflet.md`](components/SDUI5Leaflet.md)

Accessor names that differ from their designer keys: `RawClasses` → `setClasses` / `getClasses` (Raw prefix alias); `RawStyles` → `setStyles` / `getStyles` (Raw prefix alias); `RawAttributes` → `setAttributes` / `getAttributes` (Raw prefix alias).

Properties without a complete named setter/getter pair: `Lat` (setter: `—`; getter: `—`); `Lng` (setter: `—`; getter: `—`).

### SDUI5Link

Source: `SDUI5Link.bas` · Skill: [`components/SDUI5Link.md`](components/SDUI5Link.md)

Accessor names that differ from their designer keys: `RawClasses` → `setClasses` / `getClasses` (Raw prefix alias); `RawStyles` → `setStyles` / `getStyles` (Raw prefix alias); `RawAttributes` → `setAttributes` / `getAttributes` (Raw prefix alias).

Properties without a complete named setter/getter pair: `ListItem` (setter: `—`; getter: `—`).

### SDUI5List

Source: `SDUI5List.bas` · Skill: [`components/SDUI5List.md`](components/SDUI5List.md)

Accessor names that differ from their designer keys: `RawClasses` → `setClasses` / `getClasses` (Raw prefix alias); `RawStyles` → `setStyles` / `getStyles` (Raw prefix alias); `RawAttributes` → `setAttributes` / `getAttributes` (Raw prefix alias).

### SDUI5ListItem

Source: `SDUI5ListItem.bas` · Skill: [`components/SDUI5ListItem.md`](components/SDUI5ListItem.md)

Accessor names that differ from their designer keys: `RawClasses` → `setClasses` / `getClasses` (Raw prefix alias); `RawStyles` → `setStyles` / `getStyles` (Raw prefix alias); `RawAttributes` → `setAttributes` / `getAttributes` (Raw prefix alias).

### SDUI5Loading

Source: `SDUI5Loading.bas` · Skill: [`components/SDUI5Loading.md`](components/SDUI5Loading.md)

Accessor names that differ from their designer keys: `RawClasses` → `setClasses` / `getClasses` (Raw prefix alias); `RawStyles` → `setStyles` / `getStyles` (Raw prefix alias); `RawAttributes` → `setAttributes` / `getAttributes` (Raw prefix alias).

### SDUI5LottiePlayer

Source: `SDUI5LottiePlayer.bas` · Skill: [`components/SDUI5LottiePlayer.md`](components/SDUI5LottiePlayer.md)

Accessor names that differ from their designer keys: `RawClasses` → `setClasses` / `getClasses` (Raw prefix alias); `RawStyles` → `setStyles` / `getStyles` (Raw prefix alias); `RawAttributes` → `setAttributes` / `getAttributes` (Raw prefix alias).

### SDUI5Megamenu

Source: `SDUI5Megamenu.bas` · Skill: [`components/SDUI5Megamenu.md`](components/SDUI5Megamenu.md)

Accessor names that differ from their designer keys: `RawClasses` → `setClasses` / `getClasses` (Raw prefix alias); `RawStyles` → `setStyles` / `getStyles` (Raw prefix alias); `RawAttributes` → `setAttributes` / `getAttributes` (Raw prefix alias).

### SDUI5Menu

Source: `SDUI5Menu.bas` · Skill: [`components/SDUI5Menu.md`](components/SDUI5Menu.md)

Accessor names that differ from their designer keys: `RawItemClasses` → `setItemClasses` / `getItemClasses` (Raw prefix alias); `RawItemStyles` → `setItemStyles` / `getItemStyles` (Raw prefix alias); `RawClasses` → `setClasses` / `getClasses` (Raw prefix alias); `RawStyles` → `setStyles` / `getStyles` (Raw prefix alias); `RawAttributes` → `setAttributes` / `getAttributes` (Raw prefix alias).

Properties without a complete named setter/getter pair: `NoWrap` (setter: `setNoWrap`; getter: `—`).

### SDUI5MenuItem

Source: `SDUI5MenuItem.bas` · Skill: [`components/SDUI5MenuItem.md`](components/SDUI5MenuItem.md)

Accessor names that differ from their designer keys: `RawItemClasses` → `setItemClasses` / `getItemClasses` (Raw prefix alias); `RawItemStyles` → `setItemStyles` / `getItemStyles` (Raw prefix alias); `RawClasses` → `setClasses` / `getClasses` (Raw prefix alias); `RawStyles` → `setStyles` / `getStyles` (Raw prefix alias); `RawAttributes` → `setAttributes` / `getAttributes` (Raw prefix alias).

Properties without a complete named setter/getter pair: `Tooltip` (setter: `—`; getter: `getTooltip`); `TooltipPosition` (setter: `—`; getter: `getTooltipPosition`).

### SDUI5Modal

Source: `SDUI5Modal.bas` · Skill: [`components/SDUI5Modal.md`](components/SDUI5Modal.md)

Accessor names that differ from their designer keys: `RawHtml` → `setHTML` / `getHTML` (Raw prefix alias); `RawClasses` → `setClasses` / `getClasses` (Raw prefix alias); `RawStyles` → `setStyles` / `getStyles` (Raw prefix alias); `RawAttributes` → `setAttributes` / `getAttributes` (Raw prefix alias).

Properties without a complete named setter/getter pair: `ReadMe` (setter: `—`; getter: `—`).

### SDUI5MultiSelect

Source: `SDUI5MultiSelect.bas` · Skill: [`components/SDUI5MultiSelect.md`](components/SDUI5MultiSelect.md)

Accessor names that differ from their designer keys: `RawOptions` → `setOptions` / `getOptions` (Raw prefix alias); `RawClasses` → `setClasses` / `getClasses` (Raw prefix alias); `RawStyles` → `setStyles` / `getStyles` (Raw prefix alias); `RawAttributes` → `setAttributes` / `getAttributes` (Raw prefix alias).

### SDUI5NavBar

Source: `SDUI5NavBar.bas` · Skill: [`components/SDUI5NavBar.md`](components/SDUI5NavBar.md)

Accessor names that differ from their designer keys: `RawClasses` → `setClasses` / `getClasses` (Raw prefix alias); `RawStyles` → `setStyles` / `getStyles` (Raw prefix alias); `RawAttributes` → `setAttributes` / `getAttributes` (Raw prefix alias).

Properties without a complete named setter/getter pair: `ReadMe` (setter: `—`; getter: `—`); `GradientActive` (setter: `—`; getter: `—`); `Gradient` (setter: `—`; getter: `—`); `GradientColor1` (setter: `—`; getter: `—`); `GradientColor2` (setter: `—`; getter: `—`).

### SDUI5NoUISlider

Source: `SDUI5NoUISlider.bas` · Skill: [`components/SDUI5NoUISlider.md`](components/SDUI5NoUISlider.md)

Accessor names that differ from their designer keys: `RawClasses` → `setClasses` / `getClasses` (Raw prefix alias); `RawStyles` → `setStyles` / `getStyles` (Raw prefix alias); `RawAttributes` → `setAttributes` / `getAttributes` (Raw prefix alias).

### SDUI5OfficeRibbon

Source: `SDUI5OfficeRibbon.bas` · Skill: [`components/SDUI5OfficeRibbon.md`](components/SDUI5OfficeRibbon.md)

Properties without a complete named setter/getter pair: `LicenseKey` (setter: `—`; getter: `—`).

### SDUI5OTP

Source: `SDUI5OTP.bas` · Skill: [`components/SDUI5OTP.md`](components/SDUI5OTP.md)

Accessor names that differ from their designer keys: `RawClasses` → `setClasses` / `getClasses` (Raw prefix alias); `RawStyles` → `setStyles` / `getStyles` (Raw prefix alias); `RawAttributes` → `setAttributes` / `getAttributes` (Raw prefix alias).

### SDUI5Page

Source: `SDUI5Page.bas` · Skill: [`components/SDUI5Page.md`](components/SDUI5Page.md)

Accessor names that differ from their designer keys: `RawDescription` → `setDescription` / `getDescription` (Raw prefix alias); `RawKeywords` → `setKeywords` / `getKeywords` (Raw prefix alias); `RawClasses` → `setClasses` / `getClasses` (Raw prefix alias); `RawStyles` → `setStyles` / `getStyles` (Raw prefix alias); `RawAttributes` → `setAttributes` / `getAttributes` (Raw prefix alias).

Properties without a complete named setter/getter pair: `GradientActive` (setter: `—`; getter: `—`); `Gradient` (setter: `—`; getter: `—`); `GradientColor1` (setter: `—`; getter: `—`); `GradientColor2` (setter: `—`; getter: `—`).

### SDUI5Panel

Source: `SDUI5Panel.bas` · Skill: [`components/SDUI5Panel.md`](components/SDUI5Panel.md)

Accessor names that differ from their designer keys: `RawBorderColor` → `setBorderColor` / `getBorderColor` (Raw prefix alias); `RawBorderStyle` → `setBorderStyle` / `getBorderStyle` (Raw prefix alias); `RawBorderWidth` → `setBorderWidth` / `getBorderWidth` (Raw prefix alias); `RawBorderRadius` → `setBorderRadius` / `getBorderRadius` (Raw prefix alias); `RawClasses` → `setClasses` / `getClasses` (Raw prefix alias); `RawStyles` → `setStyles` / `getStyles` (Raw prefix alias); `RawAttributes` → `setAttributes` / `getAttributes` (Raw prefix alias).

### SDUI5PDFViewer

Source: `SDUI5PDFViewer.bas` · Skill: [`components/SDUI5PDFViewer.md`](components/SDUI5PDFViewer.md)

Accessor names that differ from their designer keys: `RawClasses` → `setClasses` / `getClasses` (Raw prefix alias); `RawStyles` → `setStyles` / `getStyles` (Raw prefix alias); `RawAttributes` → `setAttributes` / `getAttributes` (Raw prefix alias).

### SDUI5Phone

Source: `SDUI5Phone.bas` · Skill: [`components/SDUI5Phone.md`](components/SDUI5Phone.md)

Accessor names that differ from their designer keys: `RawClasses` → `setClasses` / `getClasses` (Raw prefix alias); `RawStyles` → `setStyles` / `getStyles` (Raw prefix alias); `RawAttributes` → `setAttributes` / `getAttributes` (Raw prefix alias).

### SDUI5Pivot

Source: `SDUI5Pivot.bas` · Skill: [`components/SDUI5Pivot.md`](components/SDUI5Pivot.md)

Accessor names that differ from their designer keys: `RawClasses` → `setClasses` / `getClasses` (Raw prefix alias); `RawStyles` → `setStyles` / `getStyles` (Raw prefix alias); `RawAttributes` → `setAttributes` / `getAttributes` (Raw prefix alias).

### SDUI5Preferences

Source: `SDUI5Preferences.bas` · Skill: [`components/SDUI5Preferences.md`](components/SDUI5Preferences.md)

Accessor names that differ from their designer keys: `RawClasses` → `setClasses` / `getClasses` (Raw prefix alias); `RawStyles` → `setStyles` / `getStyles` (Raw prefix alias); `RawAttributes` → `setAttributes` / `getAttributes` (Raw prefix alias).

Properties without a complete named setter/getter pair: `HasActions` (setter: `setHasActions`; getter: `—`); `HasAddNew` (setter: `setHasAddNew`; getter: `—`); `HasSave` (setter: `setHasSave`; getter: `—`); `HasDelete` (setter: `setHasDelete`; getter: `—`); `HasRefresh` (setter: `setHasRefresh`; getter: `—`); `HasUpload` (setter: `setHasUpload`; getter: `—`); `DownloadTooltip` (setter: `—`; getter: `getDownloadTooltip`); `HasBack` (setter: `setHasBack`; getter: `—`); `TooltipPosition` (setter: `—`; getter: `—`); `ActionType` (setter: `—`; getter: `—`).

### SDUI5Progress

Source: `SDUI5Progress.bas` · Skill: [`components/SDUI5Progress.md`](components/SDUI5Progress.md)

Accessor names that differ from their designer keys: `RawClasses` → `setClasses` / `getClasses` (Raw prefix alias); `RawStyles` → `setStyles` / `getStyles` (Raw prefix alias); `RawAttributes` → `setAttributes` / `getAttributes` (Raw prefix alias).

### SDUI5QRCode

Source: `SDUI5QRCode.bas` · Skill: [`components/SDUI5QRCode.md`](components/SDUI5QRCode.md)

Accessor names that differ from their designer keys: `RawClasses` → `setClasses` / `getClasses` (Raw prefix alias); `RawStyles` → `setStyles` / `getStyles` (Raw prefix alias); `RawAttributes` → `setAttributes` / `getAttributes` (Raw prefix alias).

### SDUI5QuillEditor

Source: `SDUI5QuillEditor.bas` · Skill: [`components/SDUI5QuillEditor.md`](components/SDUI5QuillEditor.md)

Accessor names that differ from their designer keys: `RawClasses` → `setClasses` / `getClasses` (Raw prefix alias); `RawStyles` → `setStyles` / `getStyles` (Raw prefix alias); `RawAttributes` → `setAttributes` / `getAttributes` (Raw prefix alias).

### SDUI5RadialProgress

Source: `SDUI5RadialProgress.bas` · Skill: [`components/SDUI5RadialProgress.md`](components/SDUI5RadialProgress.md)

Accessor names that differ from their designer keys: `RawClasses` → `setClasses` / `getClasses` (Raw prefix alias); `RawStyles` → `setStyles` / `getStyles` (Raw prefix alias); `RawAttributes` → `setAttributes` / `getAttributes` (Raw prefix alias).

### SDUI5Radio

Source: `SDUI5Radio.bas` · Skill: [`components/SDUI5Radio.md`](components/SDUI5Radio.md)

Accessor names that differ from their designer keys: `RawClasses` → `setClasses` / `getClasses` (Raw prefix alias); `RawStyles` → `setStyles` / `getStyles` (Raw prefix alias); `RawAttributes` → `setAttributes` / `getAttributes` (Raw prefix alias).

Properties without a complete named setter/getter pair: `Size` (setter: `setSize`; getter: `—`).

### SDUI5RadioGroup

Source: `SDUI5RadioGroup.bas` · Skill: [`components/SDUI5RadioGroup.md`](components/SDUI5RadioGroup.md)

Accessor names that differ from their designer keys: `RawOptions` → `setOptions` / `getOptions` (Raw prefix alias); `RawClasses` → `setClasses` / `getClasses` (Raw prefix alias); `RawStyles` → `setStyles` / `getStyles` (Raw prefix alias); `RawAttributes` → `setAttributes` / `getAttributes` (Raw prefix alias).

Properties without a complete named setter/getter pair: `Size` (setter: `setSize`; getter: `—`).

### SDUI5Range

Source: `SDUI5Range.bas` · Skill: [`components/SDUI5Range.md`](components/SDUI5Range.md)

Accessor names that differ from their designer keys: `RawClasses` → `setClasses` / `getClasses` (Raw prefix alias); `RawStyles` → `setStyles` / `getStyles` (Raw prefix alias); `RawAttributes` → `setAttributes` / `getAttributes` (Raw prefix alias).

### SDUI5Rating

Source: `SDUI5Rating.bas` · Skill: [`components/SDUI5Rating.md`](components/SDUI5Rating.md)

Accessor names that differ from their designer keys: `RatingBackgroundColor` → `setRangeBackgroundColor` / `getRatingBackgroundColor` (backing-field alias); `RawClasses` → `setClasses` / `getClasses` (Raw prefix alias); `RawStyles` → `setStyles` / `getStyles` (Raw prefix alias); `RawAttributes` → `setAttributes` / `getAttributes` (Raw prefix alias).

### SDUI5Row

Source: `SDUI5Row.bas` · Skill: [`components/SDUI5Row.md`](components/SDUI5Row.md)

Accessor names that differ from their designer keys: `RawBorderColor` → `setBorderColor` / `getBorderColor` (Raw prefix alias); `RawBorderStyle` → `setBorderStyle` / `getBorderStyle` (Raw prefix alias); `RawBorderWidth` → `setBorderWidth` / `getBorderWidth` (Raw prefix alias); `RawBorderRadius` → `setBorderRadius` / `getBorderRadius` (Raw prefix alias); `RawClasses` → `setClasses` / `getClasses` (Raw prefix alias); `RawStyles` → `setStyles` / `getStyles` (Raw prefix alias); `RawAttributes` → `setAttributes` / `getAttributes` (Raw prefix alias).

### SDUI5Segment

Source: `SDUI5Segment.bas` · Skill: [`components/SDUI5Segment.md`](components/SDUI5Segment.md)

Accessor names that differ from their designer keys: `RawOptions` → `setOptions` / `getOptions` (Raw prefix alias); `RawClasses` → `setClasses` / `getClasses` (Raw prefix alias); `RawStyles` → `setStyles` / `getStyles` (Raw prefix alias); `RawAttributes` → `setAttributes` / `getAttributes` (Raw prefix alias).

Properties without a complete named setter/getter pair: `Enabled` (setter: `—`; getter: `—`).

### SDUI5Select

Source: `SDUI5Select.bas` · Skill: [`components/SDUI5Select.md`](components/SDUI5Select.md)

Accessor names that differ from their designer keys: `RawOptions` → `setOptions` / `getOptions` (Raw prefix alias); `RawClasses` → `setClasses` / `getClasses` (Raw prefix alias); `RawStyles` → `setStyles` / `getStyles` (Raw prefix alias); `RawAttributes` → `setAttributes` / `getAttributes` (Raw prefix alias).

### SDUI5SignaturePad

Source: `SDUI5SignaturePad.bas` · Skill: [`components/SDUI5SignaturePad.md`](components/SDUI5SignaturePad.md)

Accessor names that differ from their designer keys: `RawClasses` → `setClasses` / `getClasses` (Raw prefix alias); `RawStyles` → `setStyles` / `getStyles` (Raw prefix alias); `RawAttributes` → `setAttributes` / `getAttributes` (Raw prefix alias).

Properties without a complete named setter/getter pair: `BackgroundColor` (setter: `—`; getter: `—`).

### SDUI5Skeleton

Source: `SDUI5Skeleton.bas` · Skill: [`components/SDUI5Skeleton.md`](components/SDUI5Skeleton.md)

Accessor names that differ from their designer keys: `RawClasses` → `setClasses` / `getClasses` (Raw prefix alias); `RawStyles` → `setStyles` / `getStyles` (Raw prefix alias); `RawAttributes` → `setAttributes` / `getAttributes` (Raw prefix alias).

### SDUI5Slider

Source: `SDUI5Slider.bas` · Skill: [`components/SDUI5Slider.md`](components/SDUI5Slider.md)

Accessor names that differ from their designer keys: `RawClasses` → `setClasses` / `getClasses` (Raw prefix alias); `RawStyles` → `setStyles` / `getStyles` (Raw prefix alias); `RawAttributes` → `setAttributes` / `getAttributes` (Raw prefix alias).

### SDUI5SliderItem

Source: `SDUI5SliderItem.bas` · Skill: [`components/SDUI5SliderItem.md`](components/SDUI5SliderItem.md)

Accessor names that differ from their designer keys: `RawClasses` → `setClasses` / `getClasses` (Raw prefix alias); `RawStyles` → `setStyles` / `getStyles` (Raw prefix alias); `RawAttributes` → `setAttributes` / `getAttributes` (Raw prefix alias).

### SDUI5SpeedDial

Source: `SDUI5SpeedDial.bas` · Skill: [`components/SDUI5SpeedDial.md`](components/SDUI5SpeedDial.md)

Accessor names that differ from their designer keys: `RawChildKeys` → `setChildKeys` / `getChildKeys` (Raw prefix alias); `RawChildColors` → `setChildColors` / `getChildColors` (Raw prefix alias); `RawChildIcons` → `setChildIcons` / `getChildIcons` (Raw prefix alias); `RawChildText` → `setChildText` / `getChildText` (Raw prefix alias); `RawChildTextColor` → `setChildTextColor` / `getChildTextColor` (Raw prefix alias); `RawClasses` → `setClasses` / `getClasses` (Raw prefix alias); `RawStyles` → `setStyles` / `getStyles` (Raw prefix alias); `RawAttributes` → `setAttributes` / `getAttributes` (Raw prefix alias).

### SDUI5Stack

Source: `SDUI5Stack.bas` · Skill: [`components/SDUI5Stack.md`](components/SDUI5Stack.md)

Accessor names that differ from their designer keys: `RawClasses` → `setClasses` / `getClasses` (Raw prefix alias); `RawStyles` → `setStyles` / `getStyles` (Raw prefix alias); `RawAttributes` → `setAttributes` / `getAttributes` (Raw prefix alias).

### SDUI5Stat

Source: `SDUI5Stat.bas` · Skill: [`components/SDUI5Stat.md`](components/SDUI5Stat.md)

Accessor names that differ from their designer keys: `RawClasses` → `setClasses` / `getClasses` (Raw prefix alias); `RawStyles` → `setStyles` / `getStyles` (Raw prefix alias); `RawAttributes` → `setAttributes` / `getAttributes` (Raw prefix alias).

### SDUI5StatItem

Source: `SDUI5StatItem.bas` · Skill: [`components/SDUI5StatItem.md`](components/SDUI5StatItem.md)

Accessor names that differ from their designer keys: `RawClasses` → `setClasses` / `getClasses` (Raw prefix alias); `RawStyles` → `setStyles` / `getStyles` (Raw prefix alias); `RawAttributes` → `setAttributes` / `getAttributes` (Raw prefix alias).

Properties without a complete named setter/getter pair: `ReadMe` (setter: `—`; getter: `—`); `ValueTextColor` (setter: `setValueTextColor`; getter: `—`).

### SDUI5Status

Source: `SDUI5Status.bas` · Skill: [`components/SDUI5Status.md`](components/SDUI5Status.md)

Accessor names that differ from their designer keys: `RawClasses` → `setClasses` / `getClasses` (Raw prefix alias); `RawStyles` → `setStyles` / `getStyles` (Raw prefix alias); `RawAttributes` → `setAttributes` / `getAttributes` (Raw prefix alias).

### SDUI5Steps

Source: `SDUI5Steps.bas` · Skill: [`components/SDUI5Steps.md`](components/SDUI5Steps.md)

Accessor names that differ from their designer keys: `RawSteps` → `setSteps` / `getSteps` (Raw prefix alias); `RawClasses` → `setClasses` / `getClasses` (Raw prefix alias); `RawStyles` → `setStyles` / `getStyles` (Raw prefix alias); `RawAttributes` → `setAttributes` / `getAttributes` (Raw prefix alias).

Properties without a complete named setter/getter pair: `StepsColor` (setter: `—`; getter: `—`); `OverflowXAuto` (setter: `—`; getter: `—`).

### SDUI5StepsItem

Source: `SDUI5StepsItem.bas` · Skill: [`components/SDUI5StepsItem.md`](components/SDUI5StepsItem.md)

Accessor names that differ from their designer keys: `RawClasses` → `setClasses` / `getClasses` (Raw prefix alias); `RawStyles` → `setStyles` / `getStyles` (Raw prefix alias); `RawAttributes` → `setAttributes` / `getAttributes` (Raw prefix alias).

### SDUI5Svg

Source: `SDUI5Svg.bas` · Skill: [`components/SDUI5Svg.md`](components/SDUI5Svg.md)

Accessor names that differ from their designer keys: `RawClasses` → `setClasses` / `getClasses` (Raw prefix alias); `RawStyles` → `setStyles` / `getStyles` (Raw prefix alias); `RawAttributes` → `setAttributes` / `getAttributes` (Raw prefix alias).

### SDUI5Swap

Source: `SDUI5Swap.bas` · Skill: [`components/SDUI5Swap.md`](components/SDUI5Swap.md)

Accessor names that differ from their designer keys: `RawClasses` → `setClasses` / `getClasses` (Raw prefix alias); `RawStyles` → `setStyles` / `getStyles` (Raw prefix alias); `RawAttributes` → `setAttributes` / `getAttributes` (Raw prefix alias).

### SDUI5Swiper

Source: `SDUI5Swiper.bas` · Skill: [`components/SDUI5Swiper.md`](components/SDUI5Swiper.md)

Accessor names that differ from their designer keys: `RawSlideImageStyle` → `setSlideImageStyle` / `getSlideImageStyle` (Raw prefix alias); `RawSlideStyle` → `setSlideStyle` / `getSlideStyle` (Raw prefix alias); `RawClasses` → `setClasses` / `getClasses` (Raw prefix alias); `RawStyles` → `setStyles` / `getStyles` (Raw prefix alias); `RawAttributes` → `setAttributes` / `getAttributes` (Raw prefix alias).

Properties without a complete named setter/getter pair: `ReadMe` (setter: `—`; getter: `—`).

### SDUI5SwiperSlide

Source: `SDUI5SwiperSlide.bas` · Skill: [`components/SDUI5SwiperSlide.md`](components/SDUI5SwiperSlide.md)

Accessor names that differ from their designer keys: `RawImageAttributes` → `setImageAttributes` / `getImageAttributes` (Raw prefix alias); `RawImageClasses` → `setImageClasses` / `getImageClasses` (Raw prefix alias); `RawImageStyles` → `setImageStyles` / `getImageStyles` (Raw prefix alias); `RawClasses` → `setClasses` / `getClasses` (Raw prefix alias); `RawStyles` → `setStyles` / `getStyles` (Raw prefix alias); `RawAttributes` → `setAttributes` / `getAttributes` (Raw prefix alias).

### SDUI5Table

Source: `SDUI5Table.bas` · Skill: [`components/SDUI5Table.md`](components/SDUI5Table.md)

Accessor names that differ from their designer keys: `ExportToCsv` → `setHasExportToCsv` / `—` (backing-field alias); `RawClasses` → `setClasses` / `getClasses` (Raw prefix alias); `RawStyles` → `setStyles` / `getStyles` (Raw prefix alias); `RawAttributes` → `setAttributes` / `getAttributes` (Raw prefix alias).

Properties without a complete named setter/getter pair: `ReadMe` (setter: `—`; getter: `—`); `TrapRowClick` (setter: `—`; getter: `—`); `DownloadToolbarTooltip` (setter: `—`; getter: `—`); `ExportToCsv` (setter: `setHasExportToCsv`; getter: `—`).

### SDUI5Tabs

Source: `SDUI5Tabs.bas` · Skill: [`components/SDUI5Tabs.md`](components/SDUI5Tabs.md)

Accessor names that differ from their designer keys: `RawOptions` → `setOptions` / `getOptions` (Raw prefix alias); `RawClasses` → `setClasses` / `getClasses` (Raw prefix alias); `RawStyles` → `setStyles` / `getStyles` (Raw prefix alias); `RawAttributes` → `setAttributes` / `getAttributes` (Raw prefix alias).

Properties without a complete named setter/getter pair: `ReadMe` (setter: `—`; getter: `—`).

### SDUI5TabsItem

Source: `SDUI5TabsItem.bas` · Skill: [`components/SDUI5TabsItem.md`](components/SDUI5TabsItem.md)

Accessor names that differ from their designer keys: `RawClasses` → `setClasses` / `getClasses` (Raw prefix alias); `RawStyles` → `setStyles` / `getStyles` (Raw prefix alias); `RawAttributes` → `setAttributes` / `getAttributes` (Raw prefix alias).

Properties without a complete named setter/getter pair: `ReadMe` (setter: `—`; getter: `—`); `Disabled` (setter: `—`; getter: `—`).

### SDUI5Text

Source: `SDUI5Text.bas` · Skill: [`components/SDUI5Text.md`](components/SDUI5Text.md)

Accessor names that differ from their designer keys: `RawHTML` → `setHTML` / `getHTML` (Raw prefix alias); `RawClasses` → `setClasses` / `getClasses` (Raw prefix alias); `RawStyles` → `setStyles` / `getStyles` (Raw prefix alias); `RawAttributes` → `setAttributes` / `getAttributes` (Raw prefix alias).

Properties without a complete named setter/getter pair: `LoremIpsum` (setter: `—`; getter: `—`); `Rounded` (setter: `—`; getter: `—`); `Shadow` (setter: `—`; getter: `—`).

### SDUI5TextArea

Source: `SDUI5TextArea.bas` · Skill: [`components/SDUI5TextArea.md`](components/SDUI5TextArea.md)

Accessor names that differ from their designer keys: `RawClasses` → `setClasses` / `getClasses` (Raw prefix alias); `RawStyles` → `setStyles` / `getStyles` (Raw prefix alias); `RawAttributes` → `setAttributes` / `getAttributes` (Raw prefix alias).

Properties without a complete named setter/getter pair: `PrependImage` (setter: `setPrependImage`; getter: `—`).

### SDUI5TextBox

Source: `SDUI5TextBox.bas` · Skill: [`components/SDUI5TextBox.md`](components/SDUI5TextBox.md)

Accessor names that differ from their designer keys: `RawClasses` → `setClasses` / `getClasses` (Raw prefix alias); `RawStyles` → `setStyles` / `getStyles` (Raw prefix alias); `RawAttributes` → `setAttributes` / `getAttributes` (Raw prefix alias).

### SDUI5Textrotate

Source: `SDUI5Textrotate.bas` · Skill: [`components/SDUI5Textrotate.md`](components/SDUI5Textrotate.md)

Accessor names that differ from their designer keys: `RawClasses` → `setClasses` / `getClasses` (Raw prefix alias); `RawStyles` → `setStyles` / `getStyles` (Raw prefix alias); `RawAttributes` → `setAttributes` / `getAttributes` (Raw prefix alias).

### SDUI5Timeline

Source: `SDUI5Timeline.bas` · Skill: [`components/SDUI5Timeline.md`](components/SDUI5Timeline.md)

Accessor names that differ from their designer keys: `RawClasses` → `setClasses` / `getClasses` (Raw prefix alias); `RawStyles` → `setStyles` / `getStyles` (Raw prefix alias); `RawAttributes` → `setAttributes` / `getAttributes` (Raw prefix alias).

### SDUI5TimelineItem

Source: `SDUI5TimelineItem.bas` · Skill: [`components/SDUI5TimelineItem.md`](components/SDUI5TimelineItem.md)

Accessor names that differ from their designer keys: `RawClasses` → `setClasses` / `getClasses` (Raw prefix alias); `RawStyles` → `setStyles` / `getStyles` (Raw prefix alias); `RawAttributes` → `setAttributes` / `getAttributes` (Raw prefix alias).

### SDUI5ToastChart

Source: `SDUI5ToastChart.bas` · Skill: [`components/SDUI5ToastChart.md`](components/SDUI5ToastChart.md)

Accessor names that differ from their designer keys: `RawClasses` → `setClasses` / `getClasses` (Raw prefix alias); `RawStyles` → `setStyles` / `getStyles` (Raw prefix alias); `RawAttributes` → `setAttributes` / `getAttributes` (Raw prefix alias).

### SDUI5Toggle

Source: `SDUI5Toggle.bas` · Skill: [`components/SDUI5Toggle.md`](components/SDUI5Toggle.md)

Accessor names that differ from their designer keys: `RawClasses` → `setClasses` / `getClasses` (Raw prefix alias); `RawStyles` → `setStyles` / `getStyles` (Raw prefix alias); `RawAttributes` → `setAttributes` / `getAttributes` (Raw prefix alias).

### SDUI5ToolTip

Source: `SDUI5ToolTip.bas` · Skill: [`components/SDUI5ToolTip.md`](components/SDUI5ToolTip.md)

Accessor names that differ from their designer keys: `TooltipPosition` → `setPosition` / `getPosition` (backing-field alias); `TooltipAlignment` → `setAlignment` / `getAlignment` (backing-field alias).

Properties without a complete named setter/getter pair: `ReadMe` (setter: `—`; getter: `—`).

### SDUI5TreeSpider

Source: `SDUI5TreeSpider.bas` · Skill: [`components/SDUI5TreeSpider.md`](components/SDUI5TreeSpider.md)

Accessor names that differ from their designer keys: `RawClasses` → `setClasses` / `getClasses` (Raw prefix alias); `RawStyles` → `setStyles` / `getStyles` (Raw prefix alias); `RawAttributes` → `setAttributes` / `getAttributes` (Raw prefix alias).

### SDUI5TreeView

Source: `SDUI5TreeView.bas` · Skill: [`components/SDUI5TreeView.md`](components/SDUI5TreeView.md)

Accessor names that differ from their designer keys: `RawClasses` → `setClasses` / `getClasses` (Raw prefix alias); `RawStyles` → `setStyles` / `getStyles` (Raw prefix alias); `RawAttributes` → `setAttributes` / `getAttributes` (Raw prefix alias).

Properties without a complete named setter/getter pair: `ItemColor` (setter: `—`; getter: `—`); `ItemActiveColor` (setter: `—`; getter: `—`); `ItemFocusColor` (setter: `—`; getter: `—`); `ItemHoverColor` (setter: `—`; getter: `—`).

### SDUI5TrendChart

Source: `SDUI5TrendChart.bas` · Skill: [`components/SDUI5TrendChart.md`](components/SDUI5TrendChart.md)

Accessor names that differ from their designer keys: `RawClasses` → `setClasses` / `getClasses` (Raw prefix alias); `RawStyles` → `setStyles` / `getStyles` (Raw prefix alias); `RawAttributes` → `setAttributes` / `getAttributes` (Raw prefix alias).

Properties without a complete named setter/getter pair: `Height` (setter: `—`; getter: `—`); `Width` (setter: `—`; getter: `—`).

### SDUI5VideoPlayer

Source: `SDUI5VideoPlayer.bas` · Skill: [`components/SDUI5VideoPlayer.md`](components/SDUI5VideoPlayer.md)

Accessor names that differ from their designer keys: `RawClasses` → `setClasses` / `getClasses` (Raw prefix alias); `RawStyles` → `setStyles` / `getStyles` (Raw prefix alias); `RawAttributes` → `setAttributes` / `getAttributes` (Raw prefix alias).

### SDUI5WhatsApp

Source: `SDUI5WhatsApp.bas` · Skill: [`components/SDUI5WhatsApp.md`](components/SDUI5WhatsApp.md)

Accessor names that differ from their designer keys: `RawClasses` → `setClasses` / `getClasses` (Raw prefix alias); `RawStyles` → `setStyles` / `getStyles` (Raw prefix alias); `RawAttributes` → `setAttributes` / `getAttributes` (Raw prefix alias).

Properties without a complete named setter/getter pair: `ReadMe` (setter: `—`; getter: `—`).

### SDUI5Window

Source: `SDUI5Window.bas` · Skill: [`components/SDUI5Window.md`](components/SDUI5Window.md)

Accessor names that differ from their designer keys: `RawClasses` → `setClasses` / `getClasses` (Raw prefix alias); `RawStyles` → `setStyles` / `getStyles` (Raw prefix alias); `RawAttributes` → `setAttributes` / `getAttributes` (Raw prefix alias).

### SDUI5Wizard

Source: `SDUI5Wizard.bas` · Skill: [`components/SDUI5Wizard.md`](components/SDUI5Wizard.md)

Accessor names that differ from their designer keys: `RawSteps` → `setSteps` / `getSteps` (Raw prefix alias); `RawClasses` → `setClasses` / `getClasses` (Raw prefix alias); `RawStyles` → `setStyles` / `getStyles` (Raw prefix alias); `RawAttributes` → `setAttributes` / `getAttributes` (Raw prefix alias).

Properties without a complete named setter/getter pair: `ReadMe` (setter: `—`; getter: `—`).

## Source scope

The audit reads only `SDUI5*.bas` files with designer-property directives. It does not treat `Private Sub`, `CustProps`, `SetProperties`, or `DesignerCreateView` as app-facing accessors. It matches public or unqualified `Sub set<Key>`/`Sub get<Key>` names, the shared `Raw`-prefix convention, and any alternate method whose body directly writes or returns the same backing field populated from that designer key.
