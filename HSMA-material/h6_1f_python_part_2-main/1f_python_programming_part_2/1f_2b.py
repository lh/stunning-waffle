import sys
import csv
import textwrap



IDs = []
names = []
vaccine_given = []
ages = []
county = []
while True:
    try:
        filename = input("What csv file do you want to read (or exit)?")
        if filename == "exit": 
            sys.exit(1)

        if not filename.endswith('.csv'):
            print(f"Sorry, {filename} isn't a proper .csv file")
            continue
    
        with open(filename, "r") as f:
            reader = csv.reader(f, delimiter = ",")
            rows_too_long = False # flag to deal with long rows
            try:
                for row in reader:
                    if len(row) > 5:
                        print(f"Sorry, {filename} has too many columns")
                        rows_too_long = True 
                        break  # Break out of the for loop

                    # Patient ID,Name,Flu Vaccine,Age,County
                    IDs.append(row[0])
                    names.append(row[1])
                    vaccine_given.append(row[2])
                    ages.append(row[3])
                    county.append(row[4])
            except IndexError:
                print(
                    f"Sorry, {filename} doesn't have the expected format"
                    )
                continue        
            except UnicodeDecodeError:
                print(
                    f"Sorry, {filename} isn't a even a proper unicode file"
                    )
                continue          
            except csv.Error:
                print(
                    f"Sorry, {filename} isn't a proper .csv file"
                    )
                continue    
            except TypeError:       
                print(
                    f"Sorry, {filename} cannot be read from"
                    )
                continue   
            if rows_too_long:  # Check the flag after the for loop
                continue    # If the rows are too long, continue with 
                            #the next iteration of the while loop

        break       
    except FileNotFoundError:    
        print(
            f"Sorry, {filename} is not found, are you in the right directory?"
            )        
    except IsADirectoryError:
            print(
                f"Sorry, {filename} is a directory!"
                )        
    except PermissionError:
        print(
            f"Sorry, I don't have permision to open {filename}"
            )        
    except KeyboardInterrupt:
        print(
            f"You interupted me?"
            ) 
        continue
           



print("\n".join(textwrap.wrap(", ".join(map(str, names)), 79)))    

vaccinated = [status for status in vaccine_given if status == "Yes"]
percent_had_vaccine = 100 * len(vaccinated)/len(vaccine_given)

outcomes = ['Status']
vaccinated_total = [len(vaccinated)]
unvaccinated_total = [len(vaccine_given)-len(vaccinated)]
plt.simple_stacked_bar(outcomes, [vaccinated_total, unvaccinated_total], 
                       width = 100, 
                       labels = ['vaccinated', 'unvaccinated'], 
                       title = 'How many were vaccinated')
plt.show()

print(f"{percent_had_vaccine:.2f}% had the vaccine.")


