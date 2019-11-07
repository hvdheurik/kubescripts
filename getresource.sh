clear

readarray -t lines < <(kubectl api-resources -o name | sort)

echo
echo -e "\e[1m   Please select the resoure type to list: \e[0m"
echo -e "\e[93m"

select choice in "${lines[@]}"; do
  [[ -n $choice ]] || { echo "Invalid choice. Please try again." >&2; continue; }
  break # valid choice was made; exit prompt.
done

read -r pod <<<"$choice"

clear
echo -e "\e[0m"
echo $pod
echo
kubectl get $pod -A
echo
echo "Press any key to exit..."
read -n 1
echo

