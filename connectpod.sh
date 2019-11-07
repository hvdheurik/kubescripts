clear

readarray -t lines < <(kubectl get pods -o jsonpath='{range .items[*]}{.metadata.name}{"\n"}')

echo
echo -e "\e[1m   Please select the pod to connect: \e[0m"
echo -e "\e[93m"

select choice in "${lines[@]}"; do
  [[ -n $choice ]] || { echo "Invalid choice. Please try again." >&2; continue; }
  break # valid choice was made; exit prompt.
done

read -r pod <<<"$choice"
echo
echo -e "\e[32m   Connecting to: \e[44m\e[97m$pod"
echo -e "\e[0m"

kubectl exec -it $pod bash

clear
echo

