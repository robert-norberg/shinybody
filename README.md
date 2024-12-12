# shinybody

An Interactive Anatomography Widget for Shiny

# Development and testing

## 1. Basic participants data frame

In the R console create the following structure

```bash
participants <- data.frame(
     id = 1:3,
     gender = c("male", "female", "male"),
     selected_parts = c(
         "thyroid_gland, adrenal_gland",
         "heart, liver",
         "brain, kidney"
    ),
    highlighted = c("adrenal_gland", "liver", "brain")
)
```

And then run the `human` command
```bash
human(participants)
```